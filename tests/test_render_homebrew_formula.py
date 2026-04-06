from __future__ import annotations

import importlib.util
import sys
from pathlib import Path


def _load_render_module():
    script_path = (
        Path(__file__).resolve().parent.parent / "scripts" / "render_homebrew_formula.py"
    )
    spec = importlib.util.spec_from_file_location("render_homebrew_formula", script_path)
    assert spec is not None
    assert spec.loader is not None
    module = importlib.util.module_from_spec(spec)
    sys.modules[spec.name] = module
    spec.loader.exec_module(module)
    return module


def test_build_formula_includes_runtime_resources() -> None:
    module = _load_render_module()
    project_root = Path(__file__).resolve().parent.parent

    formula = module.build_formula(
        "0.1.0",
        "deadbeef",
        "sankaHQ/sanka-cli",
        project_root,
    )

    assert 'resource "click" do' in formula
    assert 'resource "httpx" do' in formula
    assert 'resource "rich" do' in formula
    assert 'resource "importlib-metadata" do' not in formula
    assert "on_linux do" in formula
    assert 'resource "secretstorage" do' in formula
    assert 'resource "cryptography" do' in formula

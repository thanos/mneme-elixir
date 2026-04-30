defmodule Mneme.HygieneTest do
  use ExUnit.Case, async: true

  test ".formatter.exs includes zig files and Zig formatter plugin" do
    formatter = File.read!(".formatter.exs")
    assert formatter =~ "{config,lib,test,native}/**/*.{ex,exs,zig}"
    assert formatter =~ "plugins: [Zig.Formatter]"
  end

  test ".gitignore excludes zigler-generated zig files and package tarball" do
    gitignore = File.read!(".gitignore")
    assert gitignore =~ "mneme-*.tar"
    assert gitignore =~ "lib/**/.Elixir.*.zig"
    refute gitignore =~ "mneme_elixir-*.tar"
  end

  test "package config has explicit publish file allowlist" do
    package = Mix.Project.config()[:package]
    files = Keyword.fetch!(package, :files)

    assert "lib" in files
    assert "native" in files
    assert "mix.exs" in files
    assert "README.md" in files
    assert "LICENSE" in files
    assert "CHANGELOG.md" in files
    assert "VERSIONING.md" in files
  end
end

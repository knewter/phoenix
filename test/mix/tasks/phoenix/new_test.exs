defmodule Mix.Tasks.Phoenix.NewTest do
  use ExUnit.Case

  @app_name "photo_blog"
  @destination_path "/tmp"

  setup_all do
    Mix.Tasks.Phoenix.New.run([@app_name, @destination_path])
    :ok
  end

  test "creates files and directories" do
    expected_files = [".gitignore",
      "README.md",
      "lib",
      "lib/photo_blog.ex",
      "lib/photo_blog/controllers/pages.ex",
      "lib/photo_blog/router.ex",
      "lib/photo_blog/supervisor.ex",
      "mix.exs",
      "test",
      "test/photo_blog_test.exs",
      "test/test_helper.exs"]

    for file <- expected_files do
      path = Path.join(project_path, file)

      assert File.exists?(path)
    end
  end

  test "files contain application name" do
    path = Path.join(project_path, "lib/photo_blog.ex")
    {:ok, content} = File.read(path)

    assert Regex.match?(~r/PhotoBlog/, content)
  end

  test "missing name and/or path arguments" do
    assert :ok == Mix.Tasks.Phoenix.New.run([])
    assert :ok == Mix.Tasks.Phoenix.New.run([@app_name])
  end

  teardown_all do
    File.rm_rf(project_path)
    :ok
  end

  def project_path do
    Path.join(@destination_path, @app_name)
  end
end

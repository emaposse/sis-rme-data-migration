resolve_home_dir() {
  SOURCE="${BASH_SOURCE:-$0}"

  # Resolve symlink
  while [ -h "$SOURCE" ]; do
    DIR="$(cd -P "$(dirname "$SOURCE")" && pwd)"
    SOURCE="$(readlink "$SOURCE")"
    [ "$(echo "$SOURCE" | cut -c1)" != "/" ] && SOURCE="$DIR/$SOURCE"
  done

  SCRIPT_DIR="$(cd -P "$(dirname "$SOURCE")" && pwd)"
  HOME_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"

  echo "$HOME_DIR"
}

declare -A SECTIONS=(
  [nvim]="install_nvim.sh"
  [ssh]="install_ssh.sh"
)

SCRIPT_DIR="./scripts"

run_section() {
  local section="$1"
  local script="$SCRIPT_DIR/${SECTIONS[$section]}"
  if [[ -f "$script" ]]; then
    echo "Running $section setup..."
    bash "$script"
  else
    echo "Script for '$section' not found: $script"
  fi
}

if [[ "$#" -eq 0 ]]; then
  echo "❗ Please provide a section name or 'all'"
  echo "Available sections: ${!SECTIONS[@]}"
  exit 1
fi

if [[ "$1" == "all" ]]; then
  for section in "${!SECTIONS[@]}"; do
    run_section "$section"
  done
else
  for arg in "$@"; do
    if [[ -n "${SECTIONS[$arg]}" ]]; then
      run_section "$arg"
    else
      echo "⚠️ Unknown section: $arg"
    fi
  done
fi

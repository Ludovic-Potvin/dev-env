# Configuration

EMAIL="ludopotvin@gmail.com"
KEY_PATH="$HOME/.ssh/id_ed25519"

echo "Generating SSH key for Github..."
ssh-keygen -t ed25519 -C "$EMAIL" -f "$KEY_PATH" -N ""

echo "setup ssh-agent..."
eval "$(ssh-agent -s)"

echo ""
echo "Your public SSH key:"
echo "--------------------------------------"
cat "$KEY_PATH.pub"
echo "--------------------------------------"

echo ""
read -p "Press Enter after adding the key to https://github.com/settings/keys ..."

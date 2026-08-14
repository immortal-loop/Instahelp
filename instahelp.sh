#!/data/data/com.termux/files/usr/bin/bash

clear

echo "======================================"
echo "          I N S T A H E L P"
echo "======================================"
echo ""
echo "       INSTAGRAM ACCOUNT HELP"
echo ""
echo "  [1] account Disabled"
echo "  [2] account Ban"
echo "  [3] account suspend"
echo "  [0] Exit"
echo ""
echo "======================================"
echo ""

read -p "Choose an option: " choice

case "$choice" in
    1)
        echo ""
        echo "Enter your username below ,"
        ;;
    2)
        echo ""
        echo "Enter your username below ,"
        ;;
    3)
        echo ""
        echo "Enter your username below ,"
        ;;
    0)
        exit 0
        ;;
    *)
        echo ""
        echo "Invalid option."
        ;;
esac

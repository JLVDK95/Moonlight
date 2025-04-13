#!/bin/bash

# Moonlight 🌙 - By JLVDK95

# ASCII Title
cat << "EOF"
**************************
*        Moonlight        *
**************************
EOF

# Afficher le menu une seule fois
echo "Welcome to Moonlight - Steganography Tool 🌙"
echo "1. Display metadata (ExifTool)"
echo "2. Embed hidden data (Steghide)"
echo "3. Extract hidden data (Steghide)"
echo "4. Convert an image (ImageMagick)"
echo "5. Encrypt a file (OpenSSL)"
echo "6. Decrypt a file (OpenSSL)"
echo "7. Exit"

# Boucle principale pour les interactions
while true; do
    # Demander une option sans réafficher le menu
    read -p "Choose an option (1-7): " option

    case $option in
        1)
            read -p "Enter the file path: " filepath
            exiftool "$filepath"
            ;;
        2)
            read -p "Enter the image file (container): " image
            read -p "Enter the file to hide: " data
            read -p "Enter a secret passphrase: " passphrase
            steghide embed -cf "$image" -ef "$data" -p "$passphrase"
            echo "Data successfully embedded!"
            ;;
        3)
            read -p "Enter the image file (container): " image
            read -p "Enter the secret passphrase: " passphrase
            steghide extract -sf "$image" -p "$passphrase"
            ;;
        4)
            read -p "Enter the JPEG file to convert: " jpeg
            read -p "Enter the output PNG file name: " png
            convert "$jpeg" "$png"
            echo "Conversion completed: $png"
            ;;
        5)
            read -p "Enter the file to encrypt: " file
            read -p "Enter the output encrypted file name: " output
            openssl enc -aes-256-cbc -salt -in "$file" -out "$output"
            echo "File successfully encrypted: $output"
            ;;
        6)
            read -p "Enter the encrypted file: " file
            read -p "Enter the output decrypted file name: " output
            openssl enc -aes-256-cbc -d -in "$file" -out "$output"
            echo "File successfully decrypted: $output"
            ;;
        7)
            echo "Goodbye!"
            break
            ;;
        *)
            echo "Invalid option. Please try again."
            ;;
    esac
done

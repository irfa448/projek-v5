#!/bin/bash

# Warna untuk teks
RED='\033[1;31m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
RESET='\033[0m'


MODULS=("git" "curl" "wget" "php" "python3" "python3-pip")


install_modul() {
    for modul in "${MODULS[@]}"; do
        echo -e "${YELLOW}Memeriksa ${modul}...${RESET}"
        if ! command -v "$modul" &> /dev/null; then
            echo -e "${RED}${modul} tidak ditemukan. Menginstal...${RESET}"
            if [[ "$modul" == "php" ]]; then
                sudo apt-get install -y php
            elif [[ "$modul" == "python3-pip" ]]; then
                sudo apt-get install -y python3-pip
            else
                sudo apt-get install -y "$modul"
            fi
            if command -v "$modul" &> /dev/null; then
                echo -e "${GREEN}${modul} berhasil diinstal.${RESET}"
            else
                echo -e "${RED}Gagal menginstal ${modul}. Periksa koneksi internet Anda.${RESET}"
            fi
        else
            echo -e "${GREEN}${modul} sudah diinstal.${RESET}"
        fi
    done
}


install_python_modules() {
    PYTHON_MODULES=("requests" "beautifulsoup4")
    for py_mod in "${PYTHON_MODULES[@]}"; do
        echo -e "${YELLOW}Memeriksa modul Python ${py_mod}...${RESET}"
        if ! pip3 show "$py_mod" &> /dev/null; then
            echo -e "${RED}${py_mod} tidak ditemukan. Menginstal...${RESET}"
            pip3 install "$py_mod"
            if pip3 show "$py_mod" &> /dev/null; then
                echo -e "${GREEN}${py_mod} berhasil diinstal.${RESET}"
            else
                echo -e "${RED}Gagal menginstal modul Python ${py_mod}.${RESET}"
            fi
        else
            echo -e "${GREEN}Modul Python ${py_mod} sudah diinstal.${RESET}"
        fi
    done
}


echo -e "${CYAN}Memulai instalasi modul yang dibutuhkan...${RESET}"
install_modul
install_python_modules
echo -e "${GREEN}Semua modul yang dibutuhkan telah diinstal.${RESET}"

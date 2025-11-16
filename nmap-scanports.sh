#!/bin/bash
echo "Start scanning..."
sudo nmap -sS -O -PI -PT 192.168.1.1/24

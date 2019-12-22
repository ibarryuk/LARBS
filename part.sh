(
echo g # Create a new empty GPT partition table
echo n # Add a new partition
echo 1 # Partition number
echo   # First sector (Accept default: 1)
echo +100M  # Last sector 
echo n # Add a new partition
echo 2 # Partition number
echo   # First sector (Accept default: 2)
echo +250M  # Last sector
echo n # Add a new partition
echo 3 # Partition number
echo   # First sector (Accept default: 3)
echo   # Last sector: remaining
echo w # Write changes
) | sudo fdisk /dev/sda



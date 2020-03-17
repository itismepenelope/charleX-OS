sudo apt -y install build-essential
sudo apt -y install bison
sudo apt -y install flex
sudo apt -y install libgmp3-dev
sudo apt -y install libmpc-dev
sudo apt -y install libmpfr-dev
sudo apt -y install texinfo
sudo apt -y install libcloog-isl-dev
sudo apt -y install libisl-dev
sudo apt -y install qemu
sudo apt -y install grub-common
sudo apt -y install xorriso
sudo apt -y install nasm
sudo apt -y install grub-pc-bin
sudo apt update && sudo apt -y upgrade

export PREFIX="$HOME/opt/cross" export TARGET=i686-elf export PATH="$PREFIX/bin:$PATH" mkdir ~/src
cd ~/src wget https://ftp.gnu.org/gnu/binutils/binutils-2.31.1.tar.xz tar -xf binutils-2.31.1.tar.xz rm binutils-2.31.1.tar.xz mkdir build-binutils cd build-binutils/ ../binutils-2.31.1/configure --target=$TARGET --prefix="$PREFIX"  --with-sysroot --disable-nls --disable-werror make make install
cd ~/src wget https://ftp.gnu.org/gnu/gcc/gcc-8.2.0/gcc-8.2.0.tar.xz tar -xf gcc-8.2.0.tar.xz rm gcc-8.2.0.tar.xz mkdir build-gcc cd build-gcc ../gcc-8.2.0/configure --target=$TARGET --prefix="$PREFIX"  --disable-nls --enable-languages=c,c++ --without-headers make all-gcc make all-target-libgcc make install-gcc make install-target-libgcc
export PATH=$HOME/opt/cross/bin:$PATH

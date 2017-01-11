#! /bin/sh

current_dir=`pwd`
target_dir="${current_dir}/deps"
if [ ! -d $target_dir ]; then
    mkdir $target_dir
fi
cd $target_dir

tmp_dist="${target_dir}/dist"
cpu_cores=4

# ------ build libevent ---------
lib_dir_name="libevent-2.0.22"
lib_download_name="libevent-2.0.22-stable.tar.gz"
if [ ! -d $lib_dir_name ]; then
    echo "build libevent start"
    wget "https://github.com/libevent/libevent/releases/download/release-2.0.22-stable/libevent-2.0.22-stable.tar.gz"
    tar xzvf $lib_download_name
    mv "libevent-2.0.22-stable" $lib_dir_name
    if [ -d $tmp_dist ]; then 
        rm -rf $tmp_dist/*
    fi
    cd $lib_dir_name
    ./configure --prefix=$tmp_dist --enable-shared=false
    make -j$cpu_cores
    make install
    cd ..
    rm -rf $lib_download_name
    rm -rf $lib_dir_name
    mv $tmp_dist $lib_dir_name
    echo "build libevent end"
fi

# ------ buid libevhtp -----------
lib_dir_name="libevhtp-1.2.10"
lib_download_name="1.2.10.tar.gz"
if [ ! -d $lib_dir_name ]; then
    echo "build libevhtp start"
    wget 'https://github.com/ellzey/libevhtp/archive/1.2.10.tar.gz'
    tar xzvf $lib_download_name
    if [ -d $tmp_dist ]; then 
        rm -rf $tmp_dist/*
    fi
    cd $lib_dir_name
    mkdir build 
    cd build
    cmake .. -DCMAKE_INSTALL_PREFIX=$tmp_dist
    make -j$cpu_cores && make install
    cd ../..
    rm -rf "1.2.10.tar.gz"
    rm -rf "libevhtp-1.2.10"
    mv $tmp_dist $lib_dir_name
    echo "build libevhtp complete"
fi

# -------- build libconfig ----------
lib_download_name="v1.5.tar.gz"
lib_dir_name="libconfig-1.5"
if [ ! -d $lib_dir_name ]; then
    echo "build libconfig start"
    wget 'https://github.com/hyperrealm/libconfig/archive/v1.5.tar.gz'
    tar xzvf $lib_download_name
    if [ -d $tmp_dist ]; then 
        rm -rf $tmp_dist/*
    fi
    cd $lib_dir_name
    aclocal
    autoconf
    automake
    ./configure --prefix=$tmp_dist --enable-shared=false
    make -j$cpu_cores
    make install
    cd ..
    rm -rf $lib_download_name
    rm -rf $lib_dir_name
    mv $tmp_dist $lib_dir_name
    echo "build libconfig end"
fi

# --------- build hiredis  ------------
lib_download_name="v0.13.3.tar.gz"
lib_dir_name="hiredis-0.13.3"
if [ ! -d $lib_dir_name ]; then
    echo "build hiredis start"
    wget "https://github.com/redis/hiredis/archive/v0.13.3.tar.gz"
    tar xzvf $lib_download_name
    if [ -d $tmp_dist ]; then 
        rm -rf $tmp_dist/*
    fi
    cd $lib_dir_name
    make -j$cpu_cores
    make install PREFIX=$tmp_dist
    cd ..
    rm $tmp_dist/lib/libhiredis.so*
    rm -rf $lib_download_name
    rm -rf $lib_dir_name
    mv $tmp_dist $lib_dir_name
    echo "build hiredis end"
fi

# --------- build fastcgi   -----------
lib_download_name="fastcgi++-2.1.tar.bz2"
lib_dir_name="fastcgi++-2.1"
if [ ! -d $lib_dir_name ]; then
    echo "build fastcgi start"
    wget "http://download.savannah.nongnu.org/releases/fastcgipp/fastcgi++-2.1.tar.bz2"
    tar xvf $lib_download_name
    if [ -d $tmp_dist ]; then 
        rm -rf $tmp_dist/*
    fi
    cd $lib_dir_name
    ./configure --prefix=$tmp_dist --enable-shared=false
    make -j$cpu_cores
    make install
    cd ..
    rm -rf $lib_download_name
    rm -rf $lib_dir_name
    mv $tmp_dist $lib_dir_name
    echo "build fastcgi end"
fi


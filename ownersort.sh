#!/bin/bash

main(){
        for i in $(ls); do
                if [ -f $i ]; then
                        echo 'Анализирую файл '$i
                        dir=$(stat -c "%U" $i)
                        echo 'Владелец файла '$i' - '$dir
                        mkdir -p $dir
                        if [ -e $dir/$i ]; then
                                echo 'Файл '$dir/$i' существует, поэтому не копируется'
                        else
                                echo 'Копирую файл '$i' в директорию '$dir
                                sudo cp -p $i $dir
                                echo 'Файл '$i' успешно скопирован в директорию '$dir
                        fi
                fi
        done
}

if [ -z $1 ]; then
	echo 'Вы забыли задать папку'
	exit 1
else
	cd $1
	main
	cd ..
fi


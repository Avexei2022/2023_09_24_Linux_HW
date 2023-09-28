#!/bin/bash

del_tmp() {
	flag=0
	if [[ -f *.bak ]]; then
		flag=1
	elif [[ -f *.tmp ]]; then
		flag=1
	elif [[ -f *.backup ]]; then
		flag=1
	else
         	echo -e '\nВременные файлы в директории '$1' отсутствуют\n'
	fi

	if flag==1; then
                echo -e '\nУдаляю файлы .bak .tmp .backup из директории '$1''
                rm -v -f *.bak *.tmp *.backup
                echo -e '\nВременные файлы удалены\n'
	else
		echo -e '\nЧто-то пошло не так\n'
		exit 77	
	fi
}

if [ -z $1 ]; then
        echo -e '\nВы забыли ввести директорию'
        exit 1
else
        if [ -d $1 ]; then
                echo -e '\nДиректория '$1' существует'
		cd $1
		del_tmp $1
		cd ..
        else
                echo -e '\nДиректория '$1' не существует\n'
                exit 7
        fi
fi








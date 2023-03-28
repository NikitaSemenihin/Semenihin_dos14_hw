1. написать bash-скрипт:
1. 1. на вход которого поступает строка, на выходе нужно получить эту строку без пробелов.
пример:
this is test sample -> thisistestsample
1.2. который сравнивает два массива на наличие общих элементов и выводит их.
пример:
arr1 = ["foo", "bar", "blah", "test", "123", "smad", "dasd", "foo"]
arr2 = ["bar", "blah", "test", "1223", "ss", "foo", "dfd"]
returns ["foo", "bar", "blah", "test"]
1.3. который выводит листинг текущей директории по расширению файла. 
для решения могут быть полезны:
- специальная переменная IFS
- вывод echo с интерпретацией "\" — echo -e
пример:
файлы в директории:
conditions.sh
Devops_Course_Lesson_6.pptx
ex3.sh
file
fizzbuzz.sh
loops.sh
redirects.sh
stderr.txt
stdout.txt
text.txt
variables.sh

вывод:
Files with sh extension:
        conditions.sh
        ex3.sh
        fizzbuzz.sh
        loops.sh
        redirects.sh
        variables.sh
Files with pptx extension:
        Devops_Course_Lesson_6.pptx
Files with no extension:
        file
Files with txt extension:
        stderr.txt
        stdout.txt
        text.txt
2. настроить утилиту top и сохранить настройки:
 - цветной вывод
 - скрыть строку с load average
 - вывести информацию по использованию процессора по ядрам
 - информация по использованию памяти в виде гистограммы
 - процессы в виде дерева

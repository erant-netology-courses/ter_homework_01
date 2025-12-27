# ter_homework_01

## Задание 1

2. Секретную инфу хранить тут: `personal.auto.tfvars`
3. Ключ: `result`, значение: `ZFn8kDESeuZRIiXI`
4. ОшибкиЖ
  - У ресурса с докером не было названия
  - У ресурса с nginx неправильное имя - надо начинать с буквы или _
  - Опечатки в обращении к "random_password" "random_string"

5. У меня локальный компьютер на винде, переменная в PATH тупила, вкладывать временной ресурс в фикс этого не хотел, поэтому:
<img width="1280" height="360" alt="image" src="https://github.com/user-attachments/assets/56839aa9-ca1e-4340-9915-654ab21844ab" />
6. Чтобы не спрашивать разрешения на действия (создания или удаления). Опасно тем, что если так сделать не подумав, можно снести какие то существующие ресурсы
<img width="970" height="328" alt="image" src="https://github.com/user-attachments/assets/d20e2f1a-3589-43d0-b5f9-2281fbc3c895" />

7. 
```
{
  "version": 4,
  "terraform_version": "1.12.2",
  "serial": 13,
  "lineage": "f4204510-58bc-1f4f-d46a-e493e2a25614",
  "outputs": {},
  "resources": [],
  "check_results": null
}
```

8. 
> keep_locally (Boolean) If true, then the Docker image won't be deleted on destroy operation. If this is false, it will delete the image from the docker local storage on destroy operation.

В коде у нас:

```
resource "docker_image" "nginx" {
  name         = "nginx:latest"
  keep_locally = true
}
```

## Задание 2
Файл с кодом - https://github.com/erant-netology-courses/ter_homework_01/blob/main/main.tf

## Задание 3
Попробовал, получил много ошибок)

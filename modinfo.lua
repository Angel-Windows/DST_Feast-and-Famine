name = "Feast and Famine Ru"
author = "Big mom"
version = "1.16.2"
description =
    "Насладитесь зрелищем!!\n\nЭто русская версия оригинального мода, включающая полный перевод и исправление ошибок, чтобы игровой процесс был ещё удобнее и понятнее.\n\nВ моде вы найдёте:\n• Альтернативные семена;\n• Дикая пшеница;\n• Яйца монстров;\n• Варианты ресурсов;\n• Куры;\n• Пасту и вяленую рыбу;\n\n…и многое другое, что сделает игру с едой ещё интереснее и разнообразнее."
forumthread = ""
api_version = 10
priority = -346
dst_compatible = true
dont_starve_compatible = false
reign_of_giants_compatible = false
shipwrecked_compatible = false
all_clients_require_mod = true
client_only_mod = false

icon_atlas = "modicon.xml"
icon = "modicon.tex"

server_filter_tags = {"FeastAndFamine"}

configuration_options = {{
    name = "config_Language",
    label = "Язык",
    hover = "",
    options = {{
        description = "Английский",
        data = "english"
    }, {
        description = "中文",
        data = "chinese"
    }, {
        description = "Русский",
        data = "russ"
    }},
    default = "russ"
}, {
    name = "Title",
    label = "",
    options = {{
        description = "",
        data = ""
    }},
    default = ""
}, {
    name = "Title",
    label = "Настройки клеток для птиц",
    options = {{
        description = "",
        data = ""
    }},
    default = ""
}, {
    name = "config_MonsterEggs",
    label = "Монстр яйца",
    hover = "Кормление птицы мясом монстров даст Монстр яйца. А если Выключить то даст обычное мясо",
    options = {{
        description = "Включить",
        data = true
    }, {
        description = "Выключить",
        data = false
    }},
    default = true
}, {
    name = "config_LeafyEggs",
    label = "Листовые яйца",
    hover = "Кормление птицы листовым мясом даст Листовые яйца. А если Выключить то даст обычное мясо",
    options = {{
        description = "Включить",
        data = true
    }, {
        description = "Выключить",
        data = false
    }},
    default = true
}, {
    name = "config_KitchenWheat",
    label = "Пшеница",
    hover = "Кормление птицы пшеницей даст семена Пшеницы.",
    options = {{
        description = "Включить",
        data = true
    }, {
        description = "Выключить",
        data = false
    }},
    default = true
}, {
    name = "config_SeedMin",
    label = "Минимум семян",
    hover = "Гарантированное количество семян, получаемых от кормления птицы.",
    options = {{
        description = "0",
        data = 0
    }, {
        description = "1",
        data = 1
    }, {
        description = "2",
        data = 2
    }, {
        description = "3",
        data = 3
    }},
    default = 1
}, {
    name = "config_SeedPlus",
    label = "Максимум семян",
    hover = "Максимальное количество семян (относительно минимального).",
    options = {{
        description = "Мин. семян +0",
        data = 0
    }, {
        description = "Мин. семян +1",
        data = 1
    }, {
        description = "Мин. семян +2",
        data = 2
    }, {
        description = "Мин. семян +3",
        data = 3
    }},
    default = 0
}, {
    name = "Title",
    label = "",
    options = {{
        description = "",
        data = ""
    }},
    default = ""
}, {
    name = "Title",
    label = "Медовые кристаллы",
    options = {{
        description = "",
        data = ""
    }},
    default = ""
}, {
    name = "config_HoneyCrystals",
    label = "Медовые кристаллы",
    hover = "Мед будет кристаллизоваться при хранении в холодильнике или на холоде.",
    options = {{
        description = "Включить",
        data = true
    }, {
        description = "Выключить",
        data = false
    }},
    default = true
}, {
    name = "config_HoneyFridge",
    label = "Хранимый в холодильнике мед",
    hover = "Мед можно помещать в холодильник.",
    options = {{
        description = "Включить",
        data = true
    }, {
        description = "Выключить",
        data = false
    }},
    default = true
}, {
    name = "Title",
    label = "",
    options = {{
        description = "",
        data = ""
    }},
    default = ""
}, {
    name = "Title",
    label = "Супы из кастрюль",
    options = {{
        description = "",
        data = ""
    }},
    default = ""
}, {
    name = "config_CarrotSoup",
    label = "Морковный суп",
    hover = "Приготовьте ужасный суп из моркови!",
    options = {{
        description = "Включить",
        data = true
    }, {
        description = "Выключить",
        data = false
    }},
    default = true
}, {
    name = "config_MushroomSoup",
    label = "Грибной суп",
    hover = "Приготовьте отвратительный суп из грибов!",
    options = {{
        description = "Включить",
        data = true
    }, {
        description = "Выключить",
        data = false
    }},
    default = true
}, {
    name = "config_StoneSoup",
    label = "Каменный суп",
    hover = "Почему бы не сломать зуб о тарелку каменного супа?",
    options = {{
        description = "Включить",
        data = true
    }, {
        description = "Выключить",
        data = false
    }},
    default = true
}, {
    name = "config_StewedMeat",
    label = "Тушёное мясо",
    hover = "Кто вообще готовит фрикадельки со льдом?",
    options = {{
        description = "Включить",
        data = true
    }, {
        description = "Выключить",
        data = false
    }},
    default = true
}, {
    name = "config_JuicyCutlet",
    label = "Сочная котлета",
    hover = "Эта ягодная котлета выглядит красиво, но почти не насыщает!",
    options = {{
        description = "Включить",
        data = true
    }, {
        description = "Выключить",
        data = false
    }},
    default = true
}, {
    name = "Title",
    label = "",
    options = {{
        description = "",
        data = ""
    }},
    default = ""
}, {
    name = "Title",
    label = "Кожаные изделия из свинины",
    options = {{
        description = "",
        data = ""
    }},
    default = ""
}, {
    name = "config_FootballLeather",
    label = "Кожа",
    hover = "Свинина гниёт. Шлемы для футбола потребуют кожу из высушенной свинины.",
    options = {{
        description = "Включить",
        data = true
    }, {
        description = "Выключить",
        data = false
    }},
    default = true
}, {
    name = "config_OtherLeather",
    label = "Дополнительная кожа",
    hover = "Кожа заменяет свинину в большинстве рецептов крафта.",
    options = {{
        description = "Включить",
        data = true
    }, {
        description = "Выключить",
        data = false
    }},
    default = true
}, {
    name = "Title",
    label = "",
    options = {{
        description = "",
        data = ""
    }},
    default = ""
}, {
    name = "Title",
    label = "Изменения баланса",
    options = {{
        description = "",
        data = ""
    }},
    default = ""
}, {
    name = "config_StoneFruit",
    label = "Изменения каменных фруктов",
    hover = "Каменные фрукты теперь дают больше камней, чем еды при добыче.",
    options = {{
        description = "Включить",
        data = true
    }, {
        description = "Выключить",
        data = false
    }},
    default = true
}, {
    name = "config_Nightlight",
    label = "Настройки ночников",
    hover = "Ночники теперь помогают защищать от лесных пожаров летом...",
    options = {{
        description = "Включить",
        data = true
    }, {
        description = "Выключить",
        data = false
    }},
    default = true
}, {
    name = "Title",
    label = "",
    options = {{
        description = "",
        data = ""
    }},
    default = ""
}, {
    name = "Title",
    label = "Внешний вид семян",
    options = {{
        description = "",
        data = ""
    }},
    default = ""
}, {
    name = "config_seedscorn",
    label = "Семена кукурузы",
    options = {{
        description = "Попкорн",
        data = true
    }, {
        description = "Кластерные семена",
        data = false
    }},
    default = true
}, {
    name = "config_seedsdragonfruit",
    label = "Семена драконьего фрукта",
    options = {{
        description = "Ценные бобы",
        data = true
    }, {
        description = "Луковичные семена",
        data = false
    }},
    default = false
}, {
    name = "config_seedsdurian",
    label = "Семена дуриана",
    options = {{
        description = "Вонючие семенные коробочки",
        data = true
    }, {
        description = "Хрупкие семенные коробочки",
        data = false
    }},
    default = true
}, {
    name = "config_seedseggplant",
    label = "Семена баклажана",
    options = {{
        description = "Полированные семена",
        data = true
    }, {
        description = "Завитковые семена",
        data = false
    }},
    default = true
}, {
    name = "config_seedspomegranate",
    label = "Семена граната",
    options = {{
        description = "Мягкие семена",
        data = true
    }, {
        description = "Ветряные семена",
        data = false
    }},
    default = true
}, {
    name = "config_seedspumpkin",
    label = "Семена тыквы",
    options = {{
        description = "Завёрнутые семена",
        data = true
    }, {
        description = "Острые семена",
        data = false
    }},
    default = true
}, {
    name = "config_seedswatermelon",
    label = "Семена арбуза",
    options = {{
        description = "Изогнутые семена",
        data = true
    }, {
        description = "Квадратные семена",
        data = false
    }},
    default = true
}, {
    name = "config_seedsasparagus",
    label = "Семена спаржи",
    options = {{
        description = "Спиральные семена",
        data = true
    }, {
        description = "Трубчатые семена",
        data = false
    }},
    default = true
}, {
    name = "config_seedspepper",
    label = "Семена перца",
    options = {{
        description = "Сморщенные семена",
        data = true
    }, {
        description = "Комковатые семена",
        data = false
    }},
    default = true
}, {
    name = "Title",
    label = "",
    options = {{
        description = "",
        data = ""
    }},
    default = ""
}, {
    name = "Title",
    label = "Разнообразие мяса",
    options = {{
        description = "",
        data = ""
    }},
    default = ""
}, {
    name = "config_MoreMeat",
    label = "Главный переключатель",
    hover = "Добавляет разнообразные виды мяса и особые шкурки для мобов. Не заменяет изменения других модов на дроп мобов.",
    options = {{
        description = "Включить",
        data = true
    }, {
        description = "Выключить",
        data = false
    }},
    default = true
}, {
    name = "config_FAF_SQUID",
    label = "Мясо кальмара",
    options = {{
        description = "Включить",
        data = true
    }, {
        description = "Выключить",
        data = false
    }},
    default = true
}, {
    name = "config_FAF_BEAR",
    label = "Вонючее медвежье мясо",
    options = {{
        description = "Включить",
        data = true
    }, {
        description = "Выключить",
        data = false
    }},
    default = true
}, {
    name = "config_FAF_DEER",
    label = "Оленина",
    options = {{
        description = "Включить",
        data = true
    }, {
        description = "Выключить",
        data = false
    }},
    default = true
}, {
    name = "config_FAF_ROCKY",
    label = "Каменное мясо",
    hover = "Добавлено как в Rock Lobsters, так и Crab King.",
    options = {{
        description = "Включить",
        data = true
    }, {
        description = "Выключить",
        data = false
    }},
    default = true
}, {
    name = "config_FAF_DRAGON",
    label = "Мясо дракона",
    options = {{
        description = "Включить",
        data = true
    }, {
        description = "Выключить",
        data = false
    }},
    default = true
}, {
    name = "config_FAF_TOAD",
    label = "Мясо жабы",
    hover = "Совместимо с Режимом без компромиссов.",
    options = {{
        description = "Включить",
        data = true
    }, {
        description = "Выключить",
        data = false
    }},
    default = true
}, {
    name = "config_FAF_BIGBIRD",
    label = "Большие ножки",
    options = {{
        description = "Включить",
        data = true
    }, {
        description = "Выключить",
        data = false
    }},
    default = true
}, {
    name = "config_FAF_MOOSE",
    label = "Мясо лося/гусака",
    options = {{
        description = "Включить",
        data = true
    }, {
        description = "Выключить",
        data = false
    }},
    default = true
}, {
    name = "config_FAF_MALB",
    label = "Мясо Малбатроса",
    options = {{
        description = "Включить",
        data = true
    }, {
        description = "Выключить",
        data = false
    }},
    default = true
}, {
    name = "config_FAF_ANTLION",
    label = "Мясо Муравьиных львов",
    options = {{
        description = "Включить",
        data = true
    }, {
        description = "Выключить",
        data = false
    }},
    default = true
}, {
    name = "config_FAF_BEEF",
    label = "Мясо Бифало",
    options = {{
        description = "Включить",
        data = true
    }, {
        description = "Выключить",
        data = false
    }},
    default = true
}, {
    name = "config_FAF_CAT",
    label = "Мясо Коткуна",
    options = {{
        description = "Включить",
        data = true
    }, {
        description = "Выключить",
        data = false
    }},
    default = true
}, {
    name = "config_FAF_GOAT",
    label = "Мясо козы",
    options = {{
        description = "Включить",
        data = true
    }, {
        description = "Выключить",
        data = false
    }},
    default = true
}, {
    name = "config_FAF_BUNNYMANMEAT",
    label = "Мясо кролика",
    options = {{
        description = "Включить",
        data = true
    }, {
        description = "Выключить",
        data = false
    }},
    default = true
}, {
    name = "config_FAF_GUARDIAN",
    label = "Мясо Стража",
    options = {{
        description = "Включить",
        data = true
    }, {
        description = "Выключить",
        data = false
    }},
    default = true
}, {
    name = "config_FAF_KOALA",
    label = "Мясо Коалефанта",
    options = {{
        description = "Включить",
        data = true
    }, {
        description = "Выключить",
        data = false
    }},
    default = true
}}


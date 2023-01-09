////////////////////////////////////////////////////////////////////////////////
// Содержит события форм, вызываемые на клиенте
////////////////////////////////////////////////////////////////////////////////

#Область ПрограммныйИнтерфейс

// Обработка оповещения.
// 
// Параметры:
//  Форма - ФормаКлиентскогоПриложения
//  ИмяСобытия - Строка - Имя события
//  Параметр - Произвольный
//  Источник - Произвольный
//  ДополнительныеПараметры - Структура - Дополнительные параметры
Процедура ОбработкаОповещения(Форма, ИмяСобытия, Параметр, Источник, ДополнительныеПараметры = Неопределено) Экспорт

	ИмяПроцедуры = "ОбработкаОповещения_" + СтрЗаменить(СтрЗаменить(Форма.ИмяФормы, ".Форма.", "_"), ".", "_");

	ПараметрыПроцедуры = Новый Структура;
	ПараметрыПроцедуры.Вставить("Форма", Форма);
	ПараметрыПроцедуры.Вставить("ИмяСобытия", ИмяСобытия);
	ПараметрыПроцедуры.Вставить("Параметр", Параметр);
	ПараметрыПроцедуры.Вставить("Источник", Источник);
	ПараметрыПроцедуры.Вставить("ДополнительныеПараметры", ДополнительныеПараметры);

	ОписаниеОповещения = Новый ОписаниеОповещения(ИмяПроцедуры, ЭтотОбъект, ПараметрыПроцедуры);

	Попытка
		ВыполнитьОбработкуОповещения(ОписаниеОповещения);
	Исключение
		ТекстОшибки = ОписаниеОшибки();
		Если Найти(ТекстОшибки, ИмяПроцедуры) = 0 Тогда
			ВызватьИсключение СтрШаблон("Ошибка при вызове обработчика %1:|%2", ИмяПроцедуры, ТекстОшибки);
		КонецЕсли;
	КонецПопытки;
	
КонецПроцедуры

// Выполняет переопределяемую команду
//
// Параметры:
//  Форма	- ФормаКлиентскогоПриложения - форма, в которой расположена команда
//  Команда	- КомандаФормы - команда формы
//  ДополнительныеПараметры	- Структура - дополнительные параметры.
//
Процедура ВыполнитьПереопределяемуюКоманду(Форма, Команда, ДополнительныеПараметры = Неопределено) Экспорт
	
	ИмяПроцедуры = "ВыполнитьПереопределяемуюКоманду_" + СтрЗаменить(СтрЗаменить(Форма.ИмяФормы, ".Форма.", "_"), ".", "_");

	ПараметрыПроцедуры = Новый Структура;
	ПараметрыПроцедуры.Вставить("Форма", Форма);
	ПараметрыПроцедуры.Вставить("Команда", Команда);
	ПараметрыПроцедуры.Вставить("ДополнительныеПараметры", ДополнительныеПараметры);

	ОписаниеОповещения = Новый ОписаниеОповещения(ИмяПроцедуры, ЭтотОбъект, ПараметрыПроцедуры);

	Попытка
		ВыполнитьОбработкуОповещения(ОписаниеОповещения);
	Исключение
		ТекстОшибки = ОписаниеОшибки();
		Если Найти(ТекстОшибки, ИмяПроцедуры) = 0 Тогда
			ВызватьИсключение СтрШаблон("Ошибка при вызове обработчика %1:|%2", ИмяПроцедуры, ТекстОшибки);
		КонецЕсли;
	КонецПопытки;
	
КонецПроцедуры

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

//@skip-check module-region-empty
#Область ОбработчикиКомандФормы


#КонецОбласти

#Область ОбработчикиСобытийФормы

#КонецОбласти

#КонецОбласти
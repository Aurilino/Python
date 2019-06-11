-------------Экспорт цен из таблицы------------------------
-------------Версия 1.0

---Тело программы---
dofile(getScriptPath().."\\dll_Index_min.lua")	--подключение файла, где описаны основные функции
is_run = true									--переменная для повторения цикла
Class = "SPBFUT"
Class1 = "TQBR"
Emit = "MXM9" --тикер фьючерса индекса ММВБ
Emit1 = "LKOH"
Emit2 = "SBER"
Emit3 = "GAZP"
Emit4 = "NVTK"


Filelog = getScriptPath().."\\export_Index_10.txt"
FileWrite = io.open(Filelog, "a")
FileWrite:write("Time,MOEX,LKOH,SBER,GAZP,NVTK\n")
FileWrite:close()

--------------------Параметры для настройки--------------------
function OnInit ()
	TableID = AllocTable() -- создание рабочей таблицы
	AddColumn(TableID, 1, "Date", true, QTABLE_STRING_TYPE, 10)
	AddColumn(TableID, 2, "Time", true, QTABLE_STRING_TYPE, 10)
	AddColumn(TableID, 3, "MOEX", true, QTABLE_STRING_TYPE, 10)
	AddColumn(TableID, 4, "LKOH", true, QTABLE_STRING_TYPE, 10)
	AddColumn(TableID, 5, "SBER", true, QTABLE_STRING_TYPE, 10)
	AddColumn(TableID, 6, "GAZP", true, QTABLE_STRING_TYPE, 10)
	AddColumn(TableID, 7, "NVTK", true, QTABLE_STRING_TYPE, 10)
	CreateWindow(TableID)  -- выведем таблицу в QUIK
	PutDataToTableInt()
end

function main()
	while is_run == true do		
		Tail() -- загрузка процесса из вспомогательного файла "dll_SBERF.lua"
		WriteToEndofFile(Filelog)
	end
end

function OnTrade(TradeX)
	--действия при появлении новой сделк 
end

function OnOrder(OrderX)
	--действи при появлении заявки
end

function OnStopOrder()
	--действия при появлении стоп заявки
end

function OnStop()
	--Действия при нажатии кнопки "Остановить"
	is_run = false
	DestroyTable(TableID)	--таюлица исчезает после остановки
end
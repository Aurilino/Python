-------------Экспорт цен из таблицы------------------------
-------------Версия 1.0

---Тело программы---
dofile(getScriptPath().."\\dll.lua")	--подключение файла, где описаны основные функции
is_run = true								--переменная для повторения цикла
Emit = "GAZP"
Class = "TQBR"
Date = getInfoParam("TRADEDATE")	--получение времени сервера
Filelog = getScriptPath().."\\GAZP\\export_"..Date..".txt"
file = io.open(Filelog,"r+") --открытие файла (для чтения)
if(file == nil) then 
	file = io.open(Filelog,"w")	--открытие файла (для записи)
end
if (file ~= nil) then
	file:write("Date_Time"..",".."Bid"..",".."Biddepth"..",".."Biddeptht"..",".."Numbids"..",".."Offer"..",".."Offerdepth"..",".."Offerdeptht"..",".."Numoffers"..",".."Open"..",".."Hight"..",".."Low"..",".."Last"..",".."Change".."\n")	-- запись данныхз в файл
	file:flush()	--сохранить файл
	file:close()	--закрытие файла
end

--------------------Параметры для настройки--------------------
function OnInit ()
	TableID = AllocTable() -- создание рабочей таблицы
	AddColumn(TableID, 1, "Date", true, QTABLE_STRING_TYPE, 10)	
	AddColumn(TableID, 2, "Time", true, QTABLE_STRING_TYPE, 10)
	AddColumn(TableID, 3, "Bid", true, QTABLE_STRING_TYPE, 10)	
	AddColumn(TableID, 4, "Biddepth", true, QTABLE_STRING_TYPE, 10)	
	AddColumn(TableID, 5, "Biddeptht", true, QTABLE_STRING_TYPE, 10)
	AddColumn(TableID, 6, "Numbids", true, QTABLE_STRING_TYPE, 10)
	AddColumn(TableID, 7, "Offer", true, QTABLE_STRING_TYPE, 10)	
	AddColumn(TableID, 8, "Offerdepth", true, QTABLE_STRING_TYPE, 10)	
	AddColumn(TableID, 9, "Offerdeptht", true, QTABLE_STRING_TYPE, 10)	
	AddColumn(TableID, 10, "Numoffers", true, QTABLE_STRING_TYPE, 10)	
	AddColumn(TableID, 11, "Open", true, QTABLE_STRING_TYPE, 10)
	AddColumn(TableID, 12, "Hight", true, QTABLE_STRING_TYPE, 10)
	AddColumn(TableID, 13, "Low", true, QTABLE_STRING_TYPE, 10)
	AddColumn(TableID, 14, "Last", true, QTABLE_STRING_TYPE, 10)
	AddColumn(TableID, 15, "Change", true, QTABLE_STRING_TYPE, 10)	
	CreateWindow(TableID)  -- выведем таблицу в QUIK
	PutDataToTableInt()
end

function main()
	while is_run == true do		
		Head() -- загрузка процесса из вспомогательного файла "dll.lua"
		WriteToEndofFile(Filelog)
	end
end


function OnStop()
	--Действия при нажатии кнопки "Остановить"
	is_run = false
	DestroyTable(TableID)	--таюлица исчезает после остановки
end
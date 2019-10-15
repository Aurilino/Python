--==========Основные расчеты==========--

function Head()		--основные вычисления
	local ServerDate = getInfoParam("TRADEDATE")	--получение времени сервера
	local ServerTime = getInfoParam("SERVERTIME")	--получение даты сервера
	local SecCode = Emit	--код инструмента
	local Class = Class		--клас инструмента
	local BID = getParamEx(Class, Emit, "BID").param_value	--лучшая цена псроса
	local BIDDEPTH = getParamEx(Class, Emit, "BIDDEPTH").param_value --спрос по лучшей цене
	local BIDDEPTHT = getParamEx(Class, Emit, "BIDDEPTHT").param_value --суммарный спрос
	local NUMBIDS = getParamEx(Class, Emit, "NUMBIDS").param_value	--количество заявок на покупку
	local OFFER = getParamEx(Class, Emit, "OFFER").param_value --лучшая цена предложения
	local OFFERDEPTH = getParamEx(Class, Emit, "OFFERDEPTH").param_value --получение по лучшей цене
	local OFFERDEPTHT = getParamEx(Class, Emit, "OFFERDEPTHT").param_value	--сумамарное предложение
	local NUMOFFERS = getParamEx(Class, Emit, "NUMOFFERS").param_value --коллчество заявок на продажу
	local OPEN = getParamEx(Class, Emit, "OPEN").param_value	--цена открытия
	local HIGH = getParamEx(Class, Emit, "HIGH").param_value	--самая высокая цена
	local LOW = getParamEx(Class, Emit, "LOW").param_value	--самая низкая цена
	local LAST = getParamEx(Class, Emit, "LAST").param_value	--цена закрытия
	local CHANGE = getParamEx(Class, Emit, "CHANGE").param_value	--изменение к предыдущей сделке
	
	
--заполнение таблицы 
	if (ServerTime ~= nil) then
		SetCell(TableID, 1, 1, ServerDate)
		SetCell(TableID, 1, 2, ServerTime)
		SetCell(TableID, 1, 3, BID)
		SetCell(TableID, 1, 4, BIDDEPTH)
		SetCell(TableID, 1, 5, BIDDEPTHT)
		SetCell(TableID, 1, 6, NUMBIDS)
		SetCell(TableID, 1, 7, OFFER)
		SetCell(TableID, 1, 8, OFFERDEPTH)
		SetCell(TableID, 1, 9, OFFERDEPTHT)
		SetCell(TableID, 1, 10, NUMOFFERS)
		SetCell(TableID, 1, 11, OPEN)
		SetCell(TableID, 1, 12, HIGH)
		SetCell(TableID, 1, 13, LOW)
		SetCell(TableID, 1, 14, LAST)
		SetCell(TableID, 1, 15, CHANGE)

		sleep(10000)
	end
end

--Вывод таблицы на экран
function PutDataToTableInt()
	local SecCode = Emit
	Clear(TableID)
	SetWindowPos(TableID, 100, 200, 550, 100)
	SetWindowCaption(TableID, "Export_"..SecCode.."_")
	InsertRow(TableID, -1)
end

--вывод данных .txt
function WriteToEndofFile(sFile, sDataString)	--запись в логфайл указанную строку
	local ServerDate = getInfoParam("TRADEDATE")
	local ServerTime = getInfoParam("SERVERTIME")
	local BID = getParamEx(Class, Emit, "BID").param_value 
	local BIDDEPTH = getParamEx(Class, Emit, "BIDDEPTH").param_value
	local BIDDEPTHT = getParamEx(Class, Emit, "BIDDEPTHT").param_value
	local NUMBIDS = getParamEx(Class, Emit, "NUMBIDS").param_value
	local OFFER = getParamEx(Class, Emit, "OFFER").param_value
	local OFFERDEPTH = getParamEx(Class, Emit, "OFFERDEPTH").param_value
	local OFFERDEPTHT = getParamEx(Class, Emit, "OFFERDEPTHT").param_value
	local NUMOFFERS = getParamEx(Class, Emit, "NUMOFFERS").param_value
	local OPEN = getParamEx(Class, Emit, "OPEN").param_value
	local HIGH = getParamEx(Class, Emit, "HIGH").param_value
	local LOW = getParamEx(Class, Emit, "LOW").param_value
	local LAST = getParamEx(Class, Emit, "LAST").param_value
	local CHANGE = getParamEx(Class, Emit, "CHANGE").param_value
	sDataString = ServerDate.." "..ServerTime..","..BID..","..BIDDEPTH..","..BIDDEPTHT..","..NUMBIDS..","..OFFER..","..OFFERDEPTH..","..OFFERDEPTHT..","..NUMOFFERS..","..OPEN..","..HIGH..","..LOW..","..LAST..","..CHANGE.."\n"
	local f = io.open(sFile,"r+") --открытие файла (для чтения)
	if (f == nil) then 
		f = io.open(sFile,"w")	--открытие файла (для записи)
	end
	if (ServerTime ~= nil) then
		if (f ~= nil) then
			f:seek("end",0)			--"end -конец файла" "set -начало файла" "cur -текущая позиция" "0 -смещение
			f:write(sDataString)	-- запись данныхз в файл
			f:flush()	--сохранить файл
			f:close()	--закрытие файла
		end
	end
end
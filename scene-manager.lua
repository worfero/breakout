require "scenes"
require "Classes.UI"

scenemanager = {}

local next = next -- variável utilizada para saber se o número de blocos na fase acabou
currentLevel = 1 -- deixa o level inicial como menu principal

function Restart() -- função para voltar ao menu principal em caso de game over
	currentLevel = 0
	LoadCurrentScene()
end

function LoadCurrentScene() -- maquina de estados para controlar qual level será carregado
	if(currentLevel == 0) then
		scenes.MainMenuLoad()
	elseif(currentLevel == 1) then
		scenes.Level1Load()
	elseif(currentLevel == 2) then
		scenes.Level2Load()
	end
end

function NextLevel() -- função para iniciar próximo level
	currentLevel = currentLevel + 1
	LoadCurrentScene()
end

function scenemanager.load() -- carrega o level inicial
	LoadCurrentScene()
end

function scenemanager.draw()
	if currentLevel == 0 then scenes.MainMenuDraw() -- carrega função draw do menu principal
	elseif currentLevel == 1 then scenes.Level1Draw() -- carrega função draw do level
	elseif currentLevel == 2 then scenes.Level2Draw() end
end

function scenemanager.update(dt)
	if currentLevel == 0 then scenes.MainMenuUpdate() -- carrega função update dos levels
	else
		scenes.commonUpdate(dt)
	end
end

function scenemanager.LOAD()
	scenemanager.load()
end

function scenemanager.UPDATE(dt)
	scenemanager.update(dt)
end

function scenemanager.DRAW()
	scenemanager.draw()
end
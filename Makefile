all:
	@echo -e "\tНе надо писать диплом в данной директории"
	@echo -e "\tНеобходимо выполнить make install от имени текущего пользователя,"
	@echo -e "\tпосле чего использовать \documentclass{gost7.32-2001}"
	@echo -e "\tПример использования расположен в файле test.tex"

test:
	xelatex test.tex	

install:
	mkdir -p ${HOME}/texmf/tex/latex/custom/
	cp *.cls ${HOME}/texmf/tex/latex/custom/

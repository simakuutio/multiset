@ECHO off
if /I %1 == init goto :init
if /I %1 == test goto :test
if /I %1 == check goto :check
if /I %1 == coverage goto :coverage

goto :eof

:init
	pip install -r dev-requirements.txt
goto :eof

:test
	py.test tests/ --doctest-modules multiset.py README.rst
goto :eof

:check
	pylint multiset
goto :eof

:coverage
	coverage run --source multiset -m py.test
	coverage report -m
goto :eof

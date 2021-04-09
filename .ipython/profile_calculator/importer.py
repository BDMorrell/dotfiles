from concurrent.futures import ThreadPoolExecutor
import importlib
import sys

modules_to_load = [
        ('numpy', 'np'),
        ('scipy.constants','cs'),
        ('scipy','sp'),
        ('pandas','pd'),
        ('sympy','sym')
        ]

def do_import(argument):
    (module_name, import_name) = argument
    thismodule = sys.modules[__name__]

    module = importlib.import_module(module_name)
    setattr(thismodule, import_name, module)
    print(module_name, 'imported as', import_name)


executor = ThreadPoolExecutor()
for module_name in modules_to_load:
    executor.submit(do_import, module_name)

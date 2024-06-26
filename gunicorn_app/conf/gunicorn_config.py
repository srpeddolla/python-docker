import multiprocessing

bind = "0.0.0.0:8080"
# Set number of workers based on CPU - good for production
workers = (multiprocessing.cpu_count() * 2) + 1
# For development, you can set workers to 1
# workers = 1
accesslog = "-"
access_log_format = '%(h)s %(l)s %(u)s %(t)s "%(r)s" %(s)s %(b)s "%(f)s" "%(a)s"'
loglevel = "debug"
capture_output = True
enable_stdio_inheritance = True

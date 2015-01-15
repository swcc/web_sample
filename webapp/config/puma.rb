environment ENV['ENV'] || 'development'

bind "tcp://0.0.0.0:#{ENV['PORT']}"

workers 2

preload_app!

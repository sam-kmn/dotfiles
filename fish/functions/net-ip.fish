function net-ip
    echo public: (curl -s ifconfig.me)
    echo local: (ipconfig getifaddr en0 or ipconfig getifaddr en1)
end

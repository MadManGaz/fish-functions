# Defined in /Users/garymoore/.config/fish/functions/rust2pi.fish @ line 2
function rust2pi --description 'Build an arm64 linux musl binary and send it to a pi'
    # This definitely won't work if the user isn't in a cargo project folder.
    # Best check for this.
    if test (cargo verify-project) != '{"success":"true"}'
        set_color --bold red; echo "You are not in a cargo project."
        return 1
    end

    # Check if LLVM is installed, this is required for it's cross platform linker.
    if not test -f /opt/homebrew/opt/llvm/bin/lld -a (uname) = Darwin
        set_color --bold red
        echo Please install LLVM with \'brew install llvm\'.
        echo This software contains a required cross platform linker.
        set_color normal
        return 1
    end

    # Check if the user has the linux arm64 toolchain installed
    if test -z (rustup target list | grep "aarch64-unknown-linux-musl (installed)")
        set_color --bold yellow
        echo Installing missing cross-toolchain for arm64
        set_color normal
        rustup target add aarch64-unknown-linux-musl
    end

    set APP_NAME (cat Cargo.toml | grep name | string split -f 2 = | string trim | string replace -a \" '')

    set APP_BINARY ./target/aarch64-unknown-linux-musl/release/$APP_NAME
    set CONFIG .cargo/config.toml

    # Check if user assigned a username in environment variable
    if test -z $PI_USERNAME
        set PI_USERNAME ubuntu
    end

    # Create a config file if it does not already exist to use
    # LLVM linker instead of apple clang one, as apple linker only
    # supports apple targets.
    if not test -f $CONFIG -a (uname) = Darwin
        set_color --bold yellow
        echo Adding config file to use cross platform linker from LLVM. \>\> .cargo/config.toml
        set_color normal

        mkdir .cargo
        touch $CONFIG
        
        echo [build] >>$CONFIG
        echo [target.aarch64-unknown-linux-musl] >>$CONFIG
        echo linker = \"/opt/homebrew/opt/llvm/bin/lld\" >>$CONFIG
    end

    set_color --bold yellow
    echo Cross-compiling project
    set_color normal
    
    if cargo build --release --target=aarch64-unknown-linux-musl
        set_color --bold yellow
        echo Stripping binary
        set_color normal

        llvm-strip $APP_BINARY

        set_color --bold yellow
        echo Please enter the password for your Raspberry Pi:
        set_color normal

        rsync $APP_BINARY $PI_USERNAME@$argv[1]:~/$APP_NAME

        set_color --bold yellow
        echo "Uploaded to ~/$APP_NAME on $PI_USERNAME@$argv[1]"
        set_color normal
    else
        set_color --bold red
        echo "Cargo project failed to build"
        set_color normal
    end
end

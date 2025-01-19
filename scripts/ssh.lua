local function ssh_select()
    local file_path = "machines.txt"  -- 你的机器列表文件路径

    local machine_names = { "dev" }
    local machine_hosts = { "user@xx.xx.xx.xx" }
    local machine_passwords = { "xxx" }

    -- 创建 fzf 输入
    local fzf_input = {}
    for _, machine in ipairs(machine_names) do
        table.insert(fzf_input, machine)
    end

    -- 使用 fzf 选择机器
    local selected = io.popen("echo \"" .. table.concat(fzf_input, "\n") .. "\" | fzf"):read("*l")

    -- 查找选中的机器的密码
    -- local selected_machine
    local index
    for key, machine in ipairs(machine_names) do
        if machine == selected then
            index = key
            break
        end
    end

    if index then
        -- 使用 sshpass 自动填充密码进行 SSH 连接
        local ssh_command = string.format("sshpass -p '%s' ssh %s", machine_passwords[index], machine_hosts[index])
        os.execute(ssh_command)
    else
        print("没有选择任何机器。")
    end
end

ssh_select()

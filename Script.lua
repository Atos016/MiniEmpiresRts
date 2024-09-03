-- Criar uma interface de usuário simples e movível
local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local AddMoneyButton = Instance.new("TextButton")
local CloseButton = Instance.new("TextButton")
local MoneyInput = Instance.new("TextBox")

ScreenGui.Parent = game.CoreGui

Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
Frame.Position = UDim2.new(0.5, -100, 0.5, -50)
Frame.Size = UDim2.new(0, 200, 0, 100)
Frame.Active = true
Frame.Draggable = true  -- Torna o Frame movível

AddMoneyButton.Parent = Frame
AddMoneyButton.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
AddMoneyButton.Position = UDim2.new(0, 10, 0, 60)
AddMoneyButton.Size = UDim2.new(0, 180, 0, 30)
AddMoneyButton.Text = "Adicionar Moedas"

CloseButton.Parent = Frame
CloseButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
CloseButton.Position = UDim2.new(0, 180, 0, 0)
CloseButton.Size = UDim2.new(0, 20, 0, 20)
CloseButton.Text = "X"

MoneyInput.Parent = Frame
MoneyInput.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
MoneyInput.Position = UDim2.new(0, 10, 0, 20)
MoneyInput.Size = UDim2.new(0, 180, 0, 30)
MoneyInput.Text = "1000"  -- Valor inicial para adicionar

-- Função para detectar e adicionar moedas
local function adicionarDinheiro(valor)
    local player = game.Players.LocalPlayer
    local stats = player:FindFirstChild("leaderstats")
    
    -- Tenta detectar a variável de moedas
    local moedas = nil
    if stats then
        for _, stat in pairs(stats:GetChildren()) do
            if stat:IsA("IntValue") and stat.Name:lower():match("moeda") then
                moedas = stat
                break
            end
        end
    end

    if moedas then
        moedas.Value = moedas.Value + valor
        print("Moedas adicionadas com sucesso!")
    else
        print("Não foi possível encontrar a variável de moedas.")
    end
end

-- Função para lidar com o clique no botão de adicionar dinheiro
AddMoneyButton.MouseButton1Click:Connect(function()
    local valor = tonumber(MoneyInput.Text)
    if valor then
        adicionarDinheiro(valor)
    else
        print("Por favor, insira um número válido.")
    end
end)

-- Função para fechar o menu
CloseButton.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

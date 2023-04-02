import mysql.connector

def inserir_dados(local_atual, local_destino, distancia, cursor):
    query = f"INSERT INTO dados_viagem (local_atual, local_destino, distancia) VALUES ('{local_atual}', '{local_destino}', {distancia})"
    cursor.execute(query)

def consultar_dados(cursor, ordenacao='distancia', database='banco_de_dados'):
    query = f"SELECT local_atual, local_destino, distancia FROM dados_viagem ORDER BY {ordenacao}"
    conexao = mysql.connector.connect(
        host="localhost",
        user="root",
        password="x",
        database="aplicativo_de_navegação"
    )
    cursor = conexao.cursor()
    cursor.execute(query)
    dados = []
    for local_atual, local_destino, distancia in cursor:
        dado = {
            'Local Atual': local_atual,
            'Local Destino': local_destino,
            'Distância': distancia
        }
        dados.append(dado)
    cursor.close()
    conexao.close()
    return dados

conexao = mysql.connector.connect(
    host="localhost",
    user="root",
    password="senha",
    database="banco_de_dados"
)
cursor = conexao.cursor()

while True:
    opcao = int(input(
                'Deseja:\n'
                '[1] - Inserir Dados\n'
                '[2] - Consultar Dados\n'
                '[3] - Sair\n'
                'Opcao:'
                ))
    
    if opcao == 1:
        local_atual = input('Digite o local atual: ')
        local_destino = input('Digite o local destino: ')
        distancia = input('Digite a distancia: ')
        if not distancia.isnumeric():
            print('distancia invalida')
            continue
        
        inserir_dados(local_atual, local_destino, float(distancia), cursor)
        conexao.commit()
    elif opcao == 2:
        dados = consultar_dados(cursor)
        for dado in dados:
            print()
            print(f"Local Atual: {dado['Local Atual']}")
            print(f"Local Destino: {dado['Local Destino']}")
            print(f"Distância: {dado['Distância']}")
            print()
    elif opcao == 3:
        break
    
    else:
        print('Operacao invalida.')
        continue

cursor.close()
conexao.close()

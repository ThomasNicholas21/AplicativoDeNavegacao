def inserir_dados(local_atual, local_destino, distancia, vetor):
    vetor.append((local_atual, local_destino, distancia))

def consultar_dados(vetor, ordenacao='distancia'):
    if ordenacao == 'distancia':
        sorted_vetor = sorted(vetor, key=lambda x: x[2])
    elif ordenacao == 'local_atual':
        sorted_vetor = sorted(vetor, key=lambda x: x[0])
    elif ordenacao == 'local_destino':
        sorted_vetor = sorted(vetor, key=lambda x: x[1])
    else:
        raise ValueError('Ordenação inválida')
    
    dados = []
    for local_atual, local_destino, distancia in sorted_vetor:
        dado = {
            'Local Atual': local_atual,
            'Local Destino': local_destino,
            'Distância': distancia
        }
        dados.append(dado)
    
    return dados

vetor = []


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
        
        inserir_dados(local_atual, local_destino, float(distancia), vetor)
    elif opcao == 2:
        dados = consultar_dados(vetor)

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



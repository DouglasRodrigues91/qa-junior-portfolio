# Dia 01 - Fundamentos de QA, Tipos de Teste e Mindset

## 🎯 Resumo dos Conceitos
- **QA vs QC:** QA foca no processo para prevenir erros antes que ocorram; QC foca no produto final para encontrar defeitos já existentes.
- **SDLC vs STLC:** SDLC é o ciclo de vida do desenvolvimento geral do sistema; STLC é o ciclo específico das etapas de testes.
- **Smoke Test (Teste de Fumaça):** Teste rápido das funcionalidades mais críticas. Se falhar, o build é rejeitado na hora.
- **Teste de Regressão:** Bateria de testes executada após alterações no código para garantir que funcionalidades antigas não quebraram.

---

## 🧪 Prática Realizada (SauceDemo - saucedemo.com)

### 1. Testes Não-Funcionais
- **Tempo de Carregamento Inicial (Aba Network):** 0.85 segundos
- **Teste de Responsividade Mobile (Ctrl + Shift + M):** A página manteve todos os botões e textos alinhados para telas pequenas.

### 2. Mapeamento de Smoke Tests (Fluxos Vitais)
1. **Autenticação:** O usuário consegue logar com credenciais válidas (`standard_user`).
2. **Adicionar ao Carrinho:** O produto é adicionado e o badge do carrinho exibe o número atualizado.
3. **Fluxo de Checkout:** O pedido é concluído com sucesso e exibe a mensagem "Thank you for your order!".

### 3. Cenário de Teste de Regressão (Carrinho / Checkout)
- **Cenário:** Atualização do cálculo de taxas na tela de pagamento.
- **Passos de Validação:**
  1. Realizar login com usuário válido.
  2. Adicionar 2 itens de preços distintos ao carrinho.
  3. Preencher os dados de entrega no checkout.
  4. Validar se a soma dos produtos com as taxas bate exatamente com o total cobrado.
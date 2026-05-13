<script setup>
</script>

<template>
  <div class="reagentes-page">
    <header class="page-header">
      <h2>Reagentes</h2>
      <button class="btn-primary">+ Novo Reagente</button>
    </header>
    
    <div class="content-area">
      <p>A lista de reagentes cadastrados aparecerá aqui.</p>
    </div>
  </div>
</template>

<style scoped>
.page-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 2rem;
}
.page-header h2 {
  margin: 0;
  color: #1f2937;
}
.btn-primary {
  background-color: #3b82f6;
  color: white;
  border: none;
  padding: 0.5rem 1rem;
  border-radius: 4px;
  cursor: pointer;
  font-weight: 500;
  transition: background-color 0.2s;
}
.btn-primary:hover {
  background-color: #2563eb;
}
.content-area {
  background: white;
  padding: 2rem;
  border-radius: 8px;
  box-shadow: 0 1px 3px rgba(0,0,0,0.1);
  text-align: center;
  color: #6b7280;
}
</style>
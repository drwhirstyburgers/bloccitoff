<template>
  <div id="app">
  <div v-for="item in items" v-bind:items="items">
  <div class='col'>
    <ul class="list-group">
      <li class="list-group-item">
        {{ item.name }}
        <div class='pull-right'>
          <strong>Created:</strong> {{ item.created_at }}
          <button class='glyphicon glyphicon-ok' v-on:click="deleteTodo(item)"></button>
        </div>
      </li>
    </ul>
  </div>
  </div>
  </div>
</template>

<script>
export default {
  props: ['items'],
  methods: {
    deleteTodo(item) {
      console.log(item.id);
      const index = this.items.indexOf(item)
      console.log(index);
      this.items.splice(index, 1);
    }
  }
}
</script>

<style scoped>
</style>

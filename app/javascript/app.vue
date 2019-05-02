<template>
  <div id="app">
  <div v-for="item in items" v-bind="items">
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
    deleteTodo: function(item) {
      const uId = item.user_id;
      const id = item.id;
      const index = this.items.indexOf(item);

      Rails.ajax({
        beforeSend: () => true,
        type: 'DELETE',
        dataType: 'json',
        url: '/users/' + uId + '/items/' + id + '/',
        data: item,
        success: (data) => {
          alert(data);
        }
      });
      this.items.splice(index, 1)
      console.log(this.items);
      console.log('http://localhost:3000/users/' + item.user_id + '/' + item.id);
    }
  }
}
</script>

<style scoped>
</style>

<template>
  <div class='col'>
    <ul class="list-group">
      <li class="list-group-item" v-if="isThere">
        {{ item.name }}
        <div class='pull-right'>
          <strong>Created:</strong> {{ item.created_at }}
          <button class='glyphicon glyphicon-ok' v-on:click="deleteItem(item)"></button>
        </div>
      </li>
    </ul>
  </div>
  </div>
</template>

<script>
export default {
  props: ['item'],
  data: function() {
    return {
      isThere: true,
    }
  },
  methods: {
    deleteItem: function(item) {
      const uId = item.user_id;
      const id = item.id;

      Rails.ajax({
        beforeSend: () => true,
        type: 'DELETE',
        dataType: 'json',
        url: '/users/' + uId + '/items/' + id + '/',
      });
      this.isThere = false;
    }
  }
}
</script>

<style scoped>
</style>

<template>
    <div id="app" class='list'>
        <item v-for="item in items" v-bind:item="item"></item>
    </div>
</template>

<script>
import item from './item.vue';

export default {
  props: ['items'],
  components: { item },
}
</script>
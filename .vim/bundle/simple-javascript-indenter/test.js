var f_user_info = require('lib/functions/user_info')

import UserInfo from './UserInfo.vue'
export default {
  data () {
    return { user_info: null }
  },

  ready () {
    f_user_info.checkNewUserInfo.call(this)
    this.resource = this.$resource('/api_get_user_info{/parm}')
  },

  methods: {
    getUserInfo: function () {
      // save item
      this.resource.get().then(function (response) {
          // success callback
          this.user_info = response.data.user_info
        }, function (response) {
          // error callback
      })
    }
  },

  route: {
    deactivate: function (transition) { // 为了解除 scroll 的事件监听
      window.off('scroll')
        transition.next()
    }
  },

  components: {
    'messages': require('../../../static/components/messages'),
    'user_info': UserInfo,
    'god_list': require('../../../static/components/god_list'),
    'add_god': require('../../../static/components/add_god')
  }
}


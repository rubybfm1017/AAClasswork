const APIUtil = require('./api_util.js')

class FollowToggle{
    constructor(el){
        this.$el = $(el);
        //debugger
        this.user_id = this.$el.data('user-id');
        this.followState = this.$el.data('initial-follow-state');
        this.render();
        this.$el.on('click', this.handleClick.bind(this));
    }

    render(){
        if (this.followState){
            this.$el.html('Unfollow');
        }else{
            this.$el.html('Follow');
        }
    }

    handleClick(e){
        let that = this;
        e.preventDefault();
        console.log(this.followState)
        if(this.followState){
            this.followState = false;
            console.log(that.user_id)
            APIUtil.unfollowUser(that.user_id).then(()=> {
                that.render();
            })
        }else{
            console.log(APIUtil.followUser(that.user_id))

            this.followState = true;
            APIUtil.followUser(that.user_id).then(() => {

                that.render();
            })
        }
    }
}

module.exports = FollowToggle;
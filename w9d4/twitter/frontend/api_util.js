const APIUtil = {
    followUser: id => APIUtil.changeFollowStatus(id, 'POST'),

    unfollowUser: id => APIUtil.changeFollowStatus(id, 'DELETE'),

    

    changeFollowStatus(id,method){
       return $.ajax({
            method: method,
            url: `/users/${id}/follow`,
            dataType: 'JSON'
        })
    }
}
    module.exports = APIUtil;

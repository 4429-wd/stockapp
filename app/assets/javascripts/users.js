$(function() {
  function addUser(user){
    let html = `
      <div class= "chat-group-form__field.clearfix">
        <p class= "chat-group-form__field--left">${user.name}</p>
        <div class="chat-group-form__field--right chat-group-users chat-group-user__btn--add" data-user-id="${user.id}" data-user-name="${user.name}">追加</div>
      </div>
      `;
      $("#user-search-result").append(html);
  }
  
  function addNoUser(){
    let html = `
      <div class="chat-group-form__search.clearfix">
        <p class="chat-group-form__input">ユーザー未登録</p>
      </div>
    `;
    $("#user-search-result").append(html);
  }
  function addDeleteUser(name, id) {
    let html = `
    <div class="chat-group-user clearfix" id="${id}">
      <p class="chat-group-user__name">${name}</p>
      <div class="user-search-remove chat-group-user__btn chat-group-user__btn--remove js-remove-btn" data-user-id="${id}" data-user-name="${name}">削除</div>
    </div>`;
    $(".js-add-user").append(html);
  }
  function addMember(userId) {
    let html = `<input value="${userId}" name="group[user_ids][]" type="hidden" id="group_user_ids_${userId}" />`;
    $(`#${userId}`).append(html);
  } 
  $("#user-search-field").on("keyup", function() {
    let input = $("#user-search-field").val();
    $.ajax({
      type: "GET",
      url: "/users",
      data: { keyword: input }, 
      dataType: 'json'
    })
      .done(function(users){
        $("#user-search-result").empty();

        if (users.length !== 0){
          users.forEach(function(user){
            addUser(user);
          });
        } else if (input.lenght == 0){
          return false;
        } else{
          addNoUser();
        }
      })
      .fail(function(){
        alert("ユーザー表示不可");
      });
  });
  $(document).on("click", ".chat-group-user__btn--add", function() {
    const userName = $(this).attr("data-user-name");
    const userId = $(this).attr("data-user-id");
    $(this)
      .parent()
      .remove();
    addDeleteUser(userName, userId);
    addMember(userId);
  });
  $(document).on("click", ".chat-group-user__btn", function() {
    $(this)
      .parent()
      .remove();
  });
});

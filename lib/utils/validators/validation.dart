class MPValidator{
  static String? validateEmail(String? value){
    if(value == null || value.isEmpty) {
      return 'Email is required';
    }
    final emailRegExp = RegExp(r'^[\w-\\.]+@([\w-]+\.)+[\w-]{2,4}$');
    //\w: Đại diện cho các ký tự chữ cái, số hoặc dấu gạch dưới.'
    // -: Cho phép sử dụng dấu gạch ngang (-).
    // \.: Dấu chấm, phải được escape với \ để biểu thị dấu chấm thực tế.
    // +: Nhóm này phải xuất hiện một hoặc nhiều lần.
    //{2,4}: Biểu thị rằng mẫu này phải xuất hiện từ 2 đến 4 lần
    if(!emailRegExp.hasMatch(value))
      {
        return 'Invalid email address';
      }
    return null;
  }
  static String? validatePassword(String? value)
  {
    if(value == null || value.isEmpty) {
      return 'Password is required';
    }
    if(value.length<8)
      {
        return 'Password must be at least 8 characters long';
      }
    //check uppercase
    if(!value.contains(RegExp(r'[A-Z]')))
      {
        return 'Password must contain at least one uppercase letter';
      }
    if(!value.contains(RegExp(r'[0-9]')))
      {
        return 'Password must contain at least one number';
      }
    if(!value.contains(RegExp(r'[!@#$%^&*(),.<>?":{}|]')))
      {
        return 'Password must contain at least one special characters';
      }
    return null;
  }
  static String? validateEmptyText(String? value,String? fiedlName){
    if(value==null||value.isEmpty)
      {
        return '$fiedlName is required';
      }
    return null;
  }
  static String? validatePhoneNumber(String? value){
    if(value==null||value.isEmpty)
      {
        return 'Phone number is required';
      }
    final phoneRegExp = RegExp(r'^\d{10}$');
    if(!phoneRegExp.hasMatch(value))
      {
        return 'Invalid phone number format (10 digits required)';
      }
    return null;
  }

}
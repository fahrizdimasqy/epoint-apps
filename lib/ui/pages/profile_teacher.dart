part of 'pages.dart';

class ProfileTeacherPage extends StatefulWidget {
  @override
  _ProfileTeacherPageState createState() => _ProfileTeacherPageState();
}

class _ProfileTeacherPageState extends State<ProfileTeacherPage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return GeneralGradientPage(
      title: 'Profile',
      subtitle: '',
      onBackButtonPressed: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => MainPageTeacher()));
      },
      child: Column(
        children: [
          //// Header
          Container(
              padding: EdgeInsets.symmetric(horizontal: defaultMargin),
              height: 220,
              margin: EdgeInsets.only(bottom: defaultMargin),
              width: double.infinity,
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  if ((context.bloc<TeacherCubit>().state as TeacherLoaded)
                          .teacher
                          .profile_photo_path ==
                      null)
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey,
                      ),
                      child: Center(
                        child: Icon(
                          Icons.person,
                          color: Colors.white,
                          size: 30, // Ukuran ikon avatar
                        ),
                      ),
                    ),
                  if ((context.bloc<TeacherCubit>().state as TeacherLoaded)
                          .teacher
                          .profile_photo_path !=
                      null)
                    Container(
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: NetworkImage(
                                  "http://10.0.2.2/epoint-api/public/storage/${(context.bloc<TeacherCubit>().state as TeacherLoaded).teacher.profile_photo_path}"),
                              fit: BoxFit.cover)),
                    ),
                  Text(
                    (context.bloc<TeacherCubit>().state as TeacherLoaded)
                        .teacher
                        .name,
                    style: GoogleFonts.poppins(
                        fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    (context.bloc<TeacherCubit>().state as TeacherLoaded)
                        .teacher
                        .position,
                    style: greyFontStyle.copyWith(fontWeight: FontWeight.w300),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: RaisedButton(
                      onPressed: () async {
                        Get.to(UpdateProfileTeacher());
                      },
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      color: Colors.blue,
                      child: Text('Update Password',
                          style: GoogleFonts.poppins()
                              .copyWith(color: Colors.white)),
                    ),
                  ),
                ],
              )),
          //// Body
          Container(
            width: double.infinity,
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 24, bottom: 10),
                  child: Text(
                    'Profile',
                    style: blackFontStyle2,
                  ),
                ),
                Divider(),
                Column(
                  children: ((selectedIndex == 0)
                          ? [
                              'NIP' +
                                  ': ' +
                                  (context.bloc<TeacherCubit>().state
                                          as TeacherLoaded)
                                      .teacher
                                      .nip,
                              'Tempat Tanggal Lahir' +
                                  ': ' +
                                  (context.bloc<TeacherCubit>().state
                                          as TeacherLoaded)
                                      .teacher
                                      .date_and_place_of_birth,
                              'Phone Number' +
                                  ': ' +
                                  (context.bloc<TeacherCubit>().state
                                          as TeacherLoaded)
                                      .teacher
                                      .phoneNumber,
                              'Address' +
                                  ': ' +
                                  (context.bloc<TeacherCubit>().state
                                          as TeacherLoaded)
                                      .teacher
                                      .address,
                            ]
                          : [
                              'Help Center',
                              'Privacy & Policy',
                              'Term & Condition'
                            ])
                      .map((e) => Padding(
                            padding: EdgeInsets.only(
                                bottom: 16,
                                left: defaultMargin,
                                right: defaultMargin),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  e,
                                  style: blackFontStyle3,
                                ),
                              ],
                            ),
                          ))
                      .toList(),
                ),
              ],
            ),
          ),

          Container(
            width: double.infinity,
            padding: EdgeInsets.all(16),
            child: RaisedButton(
              onPressed: () async {
                var apiResult = await TeacherServices.logout(Teacher.token);
                if (apiResult.value == true) {
                  // Jika logout berhasil, lakukan navigasi ke halaman login
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignInPage()));
                } else {
                  // Jika logout gagal, tampilkan pesan error
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text('Logout Error'),
                      content: Text(apiResult.message),
                      actions: [
                        FlatButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text('OK'),
                        ),
                      ],
                    ),
                  );
                }
              },
              elevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              color: Colors.red,
              child: Text('Logout',
                  style: GoogleFonts.poppins().copyWith(color: Colors.white)),
            ),
          ),

          SizedBox(height: 100)
        ],
      ),
    );
  }
}

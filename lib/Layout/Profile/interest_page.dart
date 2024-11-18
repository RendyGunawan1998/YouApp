import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core.dart';

class InterestScreen extends StatefulWidget {
  final DataProfile profile;
  InterestScreen({
    super.key,
    required this.profile,
  });

  @override
  State<InterestScreen> createState() => _InterestScreenState();
}

class _InterestScreenState extends State<InterestScreen> {
  List<String> tags = ['Music', 'Basketball'];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Container(
          height: Get.height,
          width: Get.width,
          decoration: BoxDecoration(
            color: HexColor('#11252B'),
          ),
          child: SingleChildScrollView(child:
              BlocBuilder<ProfileBloc, ProfileState>(builder: (context, state) {
            if (state is ProfileLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is ProfileLoaded) {
              tags = state.profile.interests.isNotEmpty &&
                      state.profile.interests.first != ""
                  ? state.profile.interests
                  : tags;
              return Padding(
                padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    appBarInterest(() {
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        Navigator.pushNamed(context, '/profile');
                      });
                    }, () {
                      setState(() {
                        context.read<ProfileBloc>().add(UpdatePressed(
                            name: widget.profile.name ?? "",
                            birthday: widget.profile.birthday ?? "",
                            height: widget.profile.height != null
                                ? int.parse(widget.profile.height
                                        .toString()
                                        .contains('cm')
                                    ? widget.profile.height
                                        .toString()
                                        .replaceAll(' cm', '')
                                    : widget.profile.height.toString())
                                : 0,
                            weight: widget.profile.weight != null
                                ? int.parse(widget.profile.weight
                                        .toString()
                                        .contains('kg')
                                    ? widget.profile.weight
                                        .toString()
                                        .replaceAll(' kg', '')
                                    : widget.profile.weight.toString())
                                : 0,
                            interest: tags));
                      });

                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        Navigator.pushNamed(context, '/profile');
                      });
                    }),
                    hbox(80),
                    textInter('Tell everyone about yourself',
                        HexColor('#94783E'), 14, FontWeight.w700),
                    hbox(10),
                    textInter('What interest you?', Colors.white, 20,
                        FontWeight.w700),
                    hbox(30),
                    Container(
                        decoration: BoxDecoration(
                            color: HexColor('#21363B'),
                            borderRadius: BorderRadius.circular(12)),
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(15, 6, 15, 6),
                          child: TagEditor(
                            textStyle:
                                gFontStyle(Colors.white, 14, FontWeight.w600),
                            length: tags.length,
                            delimiters: [',', ' '],
                            hasAddButton: false,
                            inputDecoration: InputDecoration(
                              border: InputBorder.none,
                            ),
                            onTagChanged: (newValue) {
                              setState(() {
                                tags.add(newValue);
                              });
                            },
                            tagBuilder: (context, index) => Chips(
                              index: index,
                              label: tags[index],
                              onDeleted: (index) {
                                setState(() {
                                  tags.removeAt(index);
                                });
                              },
                            ),
                          ),
                        )),
                  ],
                ),
              );
            }
            return Container();
          })),
        ),
      ),
    );
  }
}

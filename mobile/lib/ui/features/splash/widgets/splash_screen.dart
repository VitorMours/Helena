import "package:flutter/material.dart";
import "package:gap/gap.dart";
import "package:go_router/go_router.dart";
import "package:google_fonts/google_fonts.dart";

class SplashScreen extends StatefulWidget {
  @override
  State createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late AnimationController _buttonAnimationController;
  late Animation<double> _centralFadeAnimation;
  late Animation<double> _buttonAnimation;
  @override
  initState() {
    super.initState();
    _animationController = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );
    _buttonAnimationController = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this
    );

    _centralFadeAnimation = Tween<double>(begin: 0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeIn),
    );
    _buttonAnimation = Tween<double>(begin:0, end:1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeIn),
    );


    _animationController.forward().then((_) {
      Future.delayed(Duration(seconds: 1), () {
      });
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    _buttonAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final media = MediaQuery.of(context).size;
    final width = media.width;
    final height = media.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: width,
        height: height,
        padding: EdgeInsets.all(20), // Adiciona padding nas bordas
        child: AnimatedBuilder(
          animation: _animationController,
          builder: (context, child) {
            return Opacity(
              opacity: _centralFadeAnimation.value,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  // Título
                  Text(
                    "helena.",
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 35,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Text(
                    "Cultive Habitos, floreca com proposito.",
                    textAlign: TextAlign.center,
                    style: theme.textTheme.titleSmall,
                  ),

                  Gap(20),

                  // Planta
                  Image.asset("lib/assets/plant.png", width: 200, height: 200),

                  SizedBox(
                    width: double.infinity, // Largura total do container
                    child: AnimatedBuilder(
                      animation: _animationController,
                      builder: (context, build) {
                        return ElevatedButton(
                          onPressed: () {
                            GoRouter.of(context).push("/login");
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF7CB342),
                            // Verde
                            foregroundColor: Colors.white,
                            padding: EdgeInsets.symmetric(vertical: 18),
                            elevation: 4,
                          ),
                          child: Text(
                            "Revolucionar Hábitos",
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class Video{
  final String id;
  final String title;
  final String url;
  final String imageUrl;

  Video(this.id, this.title, this.url, this.imageUrl);

}

final List<Video> abs = [
  Video('1','HOW TO DO CRUNCHES | Perfect Crunch FOR BEGINNERS','https://www.youtube.com/watch?v=5ER5Of4MOPI','https://img.youtube.com/vi/5ER5Of4MOPI/0.jpg'),
  Video('2','30 Variations of Ab exercises!','https://www.youtube.com/watch?v=snuxyjy1jhg','https://img.youtube.com/vi/snuxyjy1jhg/0.jpg'),
  Video('3','Standing Ab Workout','https://www.youtube.com/watch?v=64cXpMTv6CE','https://img.youtube.com/vi/64cXpMTv6CE/0.jpg'),
  Video('4','How to Do a Leg Raise | Ab Workout','https://www.youtube.com/watch?v=l4kQd9eWclE','https://img.youtube.com/vi/l4kQd9eWclE/0.jpg'),
  Video('5','3 MINUTE AB WORKOUT | EASY','https://www.youtube.com/watch?v=JgeRv3L4k-U','https://img.youtube.com/vi/JgeRv3L4k-U/0.jpg'),
  Video('6','COMPLETE BENCH ABS WORKOUT / 4 BEST ABS EXS USING JUST BENCH','https://www.youtube.com/watch?v=pCO1D-dTFwM','https://img.youtube.com/vi/pCO1D-dTFwM/0.jpg'),
  Video('7','Abdominal Crunch','https://www.youtube.com/watch?v=_M2Etme-tfE','https://img.youtube.com/vi/_M2Etme-tfE/0.jpg'),
  Video('8','1 Minute SIX PACK Abs - STANDING Core Routine with Dumbbells','https://www.youtube.com/watch?v=f47t73qeSac','https://img.youtube.com/vi/f47t73qeSac/0.jpg'),
];

final List<Video> arm = [
  Video('1','Ultimate Upper Body Kettlebell Workout', 'https://www.youtube.com/watch?v=D_bFJA8Gsmw', 'https://img.youtube.com/vi/D_bFJA8Gsmw/0.jpg'),
  Video('2','Superset Arm Workout for Mass', 'https://www.youtube.com/watch?v=klF40ObD6mg', 'https://img.youtube.com/vi/klF40ObD6mg/0.jpg'),
  Video('3','KILLER ARM WORKOUT | 8 Week Body Transformation', 'https://www.youtube.com/watch?v=apt1oC_8O3U', 'https://img.youtube.com/vi/apt1oC_8O3U/0.jpg'),
  Video('4','The One-Dumbbell Workout for Bigger Arms', 'https://www.youtube.com/watch?v=WTWpRnKyyWU', 'https://img.youtube.com/vi/WTWpRnKyyWU/0.jpg'),
  Video('5','How to Do a Barbell Curl | Arm Workout', 'https://www.youtube.com/watch?v=kwG2ipFRgfo', 'https://img.youtube.com/vi/kwG2ipFRgfo/0.jpg'),
  Video('6','Ultimate Total Body Dumbbell Workout', 'https://www.youtube.com/watch?v=rIwUOwYDSWI', 'https://img.youtube.com/vi/rIwUOwYDSWI/0.jpg'),
  Video('7','Home Workout Routine - Arms / Biceps Dumbbell Exercises', 'https://www.youtube.com/watch?v=8FBvpeeSkGE', 'https://img.youtube.com/vi/8FBvpeeSkGE/0.jpg'),
  Video('8','How to Do a Hammer Curl | Arm Workout', 'https://www.youtube.com/watch?v=TwD-YGVP4Bk', 'https://img.youtube.com/vi/TwD-YGVP4Bk/0.jpg'),
];

final List<Video> back = [
  Video('1','Wide-Grip Lat Pulldown | Back Exercise Guide','https://www.youtube.com/watch?v=lueEJGjTuPQ','https://img.youtube.com/vi/lueEJGjTuPQ/0.jpg'),
  Video('2','How To: Seated Low Row (LF Cable)','https://www.youtube.com/watch?v=GZbfZ033f74','https://img.youtube.com/vi/GZbfZ033f74/0.jpg'),
  Video('3','How to Do a Dead Lift | Back Workout','https://www.youtube.com/watch?v=DNJya2CBQJ8','https://img.youtube.com/vi/DNJya2CBQJ8/0.jpg'),
  Video('4','How to Do a Dumbbell Row | Back Workout','https://www.youtube.com/watch?v=-koP10y1qZI','https://img.youtube.com/vi/-koP10y1qZI/0.jpg'),
  Video('5','Prone Dumbbell Fly','https://www.youtube.com/watch?v=vIwphYjZ0t8','https://img.youtube.com/vi/vIwphYjZ0t8/0.jpg'),
  Video('6','Smith Machine Single Arm Rows','https://www.youtube.com/watch?v=ewsa7vpoWdc','https://img.youtube.com/vi/ewsa7vpoWdc/0.jpg'),
  Video('7','How To: T-Bar Row','https://www.youtube.com/watch?v=j3Igk5nyZE4&t=49s','https://img.youtube.com/vi/j3Igk5nyZE4/0.jpg'),
  Video('8','How To: Barbell Bent-Over Row','https://www.youtube.com/watch?v=9efgcAjQe7E','https://img.youtube.com/vi/9efgcAjQe7E/0.jpg'),
];

final List<Video> chest = [
  Video('1','3 Home Chest Exercises', 'https://www.youtube.com/watch?v=lhv2fhJaHz8', 'https://img.youtube.com/vi/lhv2fhJaHz8/0.jpg'),
  Video('2','V Shred Quick Bodyweight Chest Workout', 'https://www.youtube.com/watch?v=M4h8quYFAgE', 'https://img.youtube.com/vi/M4h8quYFAgE/0.jpg'),
  Video('3','BEST 7 EXERCISES INNER CHEST', 'https://www.youtube.com/watch?v=fH8O1c_qLgk', 'https://img.youtube.com/vi/fH8O1c_qLgk/0.jpg'),
  Video('4','3 KILLER Upper Chest Exercises', 'https://www.youtube.com/watch?v=3q1Cs3ZYZ-Y', 'https://img.youtube.com/vi/3q1Cs3ZYZ-Y/0.jpg'),
  Video('5','The Chest Workout From Hell', 'https://www.youtube.com/watch?v=l-JwYtlm-PI', 'https://img.youtube.com/vi/l-JwYtlm-PI/0.jpg'),
  Video('6','How to Do an Incline Push-Up', 'https://www.youtube.com/watch?v=bXsbK9UPu3c', 'https://img.youtube.com/vi/bXsbK9UPu3c/0.jpg'),
  Video('7','How to Do an Incline Dumbbell Fly', 'https://www.youtube.com/watch?v=ajdFwa-qM98', 'https://img.youtube.com/vi/ajdFwa-qM98/0.jpg'),
  Video('8','Sadik Hadzovic Chiseled Chest Workout', 'https://www.youtube.com/watch?v=354UetdZTbM', 'https://img.youtube.com/vi/354UetdZTbM/0.jpg'),
];

final List<Video> glute = [
  Video('1','Grow Your Glutes AT HOME','https://www.youtube.com/watch?v=s0hhdUobjO0', 'https://img.youtube.com/vi/s0hhdUobjO0/0.jpg'),
  Video('2','The Glute Workout From Hell','https://www.youtube.com/watch?v=xXjuW5DYs4Q', 'https://img.youtube.com/vi/xXjuW5DYs4Q/0.jpg'),
  Video('3','Sumo Deadlift','https://www.youtube.com/watch?v=nb-3H1dStfU', 'https://img.youtube.com/vi/nb-3H1dStfU/0.jpg'),
  Video('4','How To: Hip Thrust','https://www.youtube.com/watch?v=SEdqd1n0cvg', 'https://img.youtube.com/vi/SEdqd1n0cvg/0.jpg'),
  Video('5','How To Do A Glute Bridge | The Right Way | Well+Good','https://www.youtube.com/watch?v=wPM8icPu6H8', 'https://img.youtube.com/vi/wPM8icPu6H8/0.jpg'),
  Video('6','Master Dumbbell Lunges for Glutes','https://www.youtube.com/watch?v=3frV3RnPfOY', 'https://img.youtube.com/vi/3frV3RnPfOY/0.jpg'),
  Video('7','8 Exercises to Pump up Your Glutes','https://www.youtube.com/watch?v=ipZeP7DVlNI', 'https://img.youtube.com/vi/ipZeP7DVlNI/0.jpg'),
  Video('8','HOW TO PERFORM KICKBACKS','https://www.youtube.com/watch?v=PoV-78Qzt_0', 'https://img.youtube.com/vi/PoV-78Qzt_0/0.jpg'),
];

final List<Video> leg = [
  Video('1','Stiff Leg Deadlift','https://www.youtube.com/watch?v=CkrqLaDGvOA', 'https://img.youtube.com/vi/CkrqLaDGvOA/0.jpg'),
  Video('2','Seated Calf Raise (Toes Neutral)','https://www.youtube.com/watch?v=Yh5TXz99xwY', 'https://img.youtube.com/vi/Yh5TXz99xwY/0.jpg'),
  Video('3','How To: Standing Barbell Calf Raise','https://www.youtube.com/watch?v=3UWi44yN-wM', 'https://img.youtube.com/vi/3UWi44yN-wM/0.jpg'),
  Video('4','Seated Leg Extension','https://www.youtube.com/watch?v=0fl1RRgJ83I', 'https://img.youtube.com/vi/0fl1RRgJ83I/0.jpg'),
  Video('5','Leg Press','https://www.youtube.com/watch?v=sEM_zo9w2ss', 'https://img.youtube.com/vi/sEM_zo9w2ss/0.jpg'),
  Video('6','Barbell Back Squat','https://www.youtube.com/watch?v=R2dMsNhN3DE', 'https://img.youtube.com/vi/R2dMsNhN3DE/0.jpg'),
  Video('7','How To: Prone Leg Curl (Cybex)','https://www.youtube.com/watch?v=1Tq3QdYUuHs', 'https://img.youtube.com/vi/1Tq3QdYUuHs/0.jpg'),
  Video('8','How to Do Leg Raises','https://www.youtube.com/watch?v=JB2oyawG9KI', 'https://img.youtube.com/vi/JB2oyawG9KI/0.jpg'),
];

final List<Video> shoulder = [
  Video('1','Dumbbell Seated Overhead Press', 'https://www.youtube.com/watch?v=-Xa2xYhPl-0', 'https://img.youtube.com/vi/-Xa2xYhPl-0/0.jpg'),
  Video('2','Seated Barbell Military Press', 'https://www.youtube.com/watch?v=4HCgc4S0z9g', 'https://img.youtube.com/vi/4HCgc4S0z9g/0.jpg'),
  Video('3','Wide Grip Barbell Upright Row', 'https://www.youtube.com/watch?v=IzBZ-9NSVVU', 'https://img.youtube.com/vi/IzBZ-9NSVVU/0.jpg'),
  Video('4','Kourtney Thomas — Arnold Press', 'https://www.youtube.com/watch?v=zvId5KzQGwk', 'https://img.youtube.com/vi/zvId5KzQGwk/0.jpg'),
  Video('5','Kourtney Thomas — Rear Delt Raise', 'https://www.youtube.com/watch?v=ofMGVun42bc', 'https://img.youtube.com/vi/ofMGVun42bc/0.jpg'),
  Video('6','Dumbbell Clean & Press Tutorial', 'https://www.youtube.com/watch?v=4MKfeQDkkNY', 'https://img.youtube.com/vi/4MKfeQDkkNY/0.jpg'),
  Video('7','How to Do Dumbbell Shrugs', 'https://www.youtube.com/watch?v=g6qbq4Lf1FI', 'https://img.youtube.com/vi/g6qbq4Lf1FI/0.jpg'),
  Video('8','How to Perfect Your Dumbbell Row', 'https://www.youtube.com/watch?v=roCP6wCXPqo', 'https://img.youtube.com/vi/roCP6wCXPqo/0.jpg'),
];

final List<Video> yoga = [
  Video('1','7 Yoga Poses for Upper Back Pain', 'https://www.youtube.com/watch?v=jeWbzefarHY', 'https://img.youtube.com/vi/jeWbzefarHY/0.jpg'),
  Video('2','30 BASIC BEGINNER YOGA POSES | Yoga for beginners', 'https://www.youtube.com/watch?v=rylnYQ5Eunc', 'https://img.youtube.com/vi/rylnYQ5Eunc/0.jpg'),
  Video('3','How to Do a Cat Cow Pose for Energy | Yoga', 'https://www.youtube.com/watch?v=kqnua4rHVVA', 'https://img.youtube.com/vi/kqnua4rHVVA/0.jpg'),
  Video('4','Cobra Yoga Pose', 'https://www.youtube.com/watch?v=fOdrW7nf9gw', 'https://img.youtube.com/vi/fOdrW7nf9gw/0.jpg'),
  Video('5','7 Best Yoga Poses for Spine Health', 'https://www.youtube.com/watch?v=iQXcwrcSCbE', 'https://img.youtube.com/vi/iQXcwrcSCbE/0.jpg'),
  Video('6','5 Yoga Asanas To Stimulate Your Nervous System', 'https://www.youtube.com/watch?v=5QCodeo4zt4', 'https://img.youtube.com/vi/5QCodeo4zt4/0.jpg'),
  Video('7','Yoga Poses for Kidney Health', 'https://www.youtube.com/watch?v=y_lNdXJjQDc', 'https://img.youtube.com/vi/y_lNdXJjQDc/0.jpg'),
  Video('8','5 Effective Yoga Asanas To Flush Out Kidney Stones', 'https://www.youtube.com/watch?v=ZllDiYDBMsg', 'https://img.youtube.com/vi/ZllDiYDBMsg/0.jpg'),
];
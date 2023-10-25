import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:reddit_clone/core/constants/firebase_constants.dart';
import 'package:reddit_clone/core/failure.dart';
import 'package:reddit_clone/core/providers/firebase_providers.dart';
import 'package:reddit_clone/core/type_defs.dart';
import 'package:reddit_clone/models/community_model.dart';

final communityRepositoryProvider = Provider<CommunityRepository>((ref) {
  return CommunityRepository(firestore: ref.read(firestoreProvider));
});

class CommunityRepository {
  final FirebaseFirestore _firestore;

  CommunityRepository({
    required FirebaseFirestore firestore,
  }) : _firestore = firestore;

  CollectionReference get _communities => _firestore.collection(FirebaseConstants.communitiesCollection);

  FutureVoid createCommunity(Community community) async {
    try {
      final communityDoc = await _communities.doc(community.name).get();

      if (communityDoc.exists) {
        throw "Community ${community.name} already exists";
      }

      return right(_communities.doc(community.name).set(community.toMap()));
    } on FirebaseException catch (e) {
      throw e.toString();
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  Stream<List<Community>> getUserCommunities(String uid) {
    return _communities.where("members", arrayContains: uid).snapshots().map(
      (communityData) {
        List<Community> communities = [];

        for (var community in communityData.docs) {
          communities.add(Community.fromMap(
            community.data() as Map<String, dynamic>,
          ));
        }

        return communities;
      },
    );
  }

  Stream<Community> getCommunityByName(String name) {
    return _communities.doc(name).snapshots().map((com) {
      return Community.fromMap(com.data() as Map<String, dynamic>);
    });
  }
}

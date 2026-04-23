import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:clean_architecture_bloc/core/app_asset.dart';
import 'package:clean_architecture_bloc/core/app_style.dart';
import 'package:clean_architecture_bloc/core/app_extension.dart';
import 'package:clean_architecture_bloc/core/router/app_navigation.dart';
import 'package:clean_architecture_bloc/common/bloc/bloc_helper.dart';
import 'package:clean_architecture_bloc/common/widget/text_input.dart';
import 'package:clean_architecture_bloc/common/widget/empty_widget.dart';
import 'package:clean_architecture_bloc/common/bloc/generic_bloc_builder.dart';
import 'package:clean_architecture_bloc/features/comment/domain/entities/comment_entity.dart';
import 'package:clean_architecture_bloc/features/post/domain/entities/post_entity.dart';
import 'package:clean_architecture_bloc/features/user/domain/entities/user_entity.dart';
import 'package:clean_architecture_bloc/features/post/presentation/bloc/post_bloc.dart';
import 'package:clean_architecture_bloc/features/post/presentation/bloc/post_event.dart';
import 'package:clean_architecture_bloc/features/comment/presentation/bloc/comment_bloc.dart';
import 'package:clean_architecture_bloc/features/comment/presentation/bloc/comment_event.dart';
import 'package:go_router/go_router.dart';

class PostDetailScreen extends StatefulWidget {
  const PostDetailScreen({
    super.key,
    required this.post,
    this.user,
  });

  final PostEntity post;
  final UserEntity? user;

  @override
  State<PostDetailScreen> createState() => _PostDetailScreenState();
}

class _PostDetailScreenState extends State<PostDetailScreen> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController nameEditingController = TextEditingController();
  final TextEditingController commentBodyEditingController =
      TextEditingController();
  final FocusNode userNameFocusNode = FocusNode();
  final FocusNode commentBodyFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _getUserComments();
  }

  @override
  void dispose() {
    nameEditingController.dispose();
    commentBodyEditingController.dispose();
    userNameFocusNode.dispose();
    commentBodyFocusNode.dispose();
    super.dispose();
  }

  void _getUserComments() {
    context.read<CommentBloc>().add(CommentFetched(widget.post.id));
  }

  PreferredSizeWidget _appBar(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_outlined),
        onPressed: () => context.pop(),
      ),
      actions: [
        IconButton(
          onPressed: () => _deletePost(widget.post),
          icon: const Icon(Icons.delete),
        ),
        IconButton(
          onPressed: () {
            final user = widget.user;
            if (user == null) {
              _snackBar('Missing user context for editing this post');
              return;
            }
            context.pushEditPost(user, widget.post);
          },
          icon: const Icon(Icons.edit),
        )
      ],
    );
  }

  Widget get _postItem {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: Colors.grey),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            widget.post.title,
            style: headLine1.copyWith(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 15),
          Text(widget.post.body, style: const TextStyle(fontSize: 16)),
        ],
      ),
    );
  }

  Widget get _commentItem {
    return GenericBlocBuilder<CommentBloc, CommentEntity>(
      buildWhen: (_, __) {
        return context.read<CommentBloc>().operation == ApiOperation.select
            ? true
            : false;
      },
      onRetryPressed: _getUserComments,
      emptyWidget: const EmptyWidget(message: 'No comment'),
      successWidget: (state) {
        return ListView.builder(
          shrinkWrap: true,
          itemCount: state.data?.length ?? 0,
          itemBuilder: (_, index) {
            final comment = state.data![index];
            return Row(
              children: [
                const CircleAvatar(
                  radius: 25,
                  backgroundColor: Color(0xFFcad1e2),
                  backgroundImage: AssetImage(AppAsset.user),
                ),
                Expanded(
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(comment.name, style: headLine5),
                              IconButton(
                                splashRadius: 25,
                                padding: EdgeInsets.zero,
                                constraints: const BoxConstraints(),
                                onPressed: () => _deleteComment(comment),
                                icon: const Icon(
                                  Icons.clear,
                                  color: Colors.redAccent,
                                ),
                              )
                            ],
                          ),
                          const SizedBox(height: 8),
                          Text(comment.body)
                        ],
                      ),
                    ),
                  ),
                )
              ],
            );
          },
        );
      },
    );
  }

  void _deletePost(PostEntity post) {
    context.read<PostBloc>().add(PostDeleted(post));
    showDialog(
      context: context,
      builder: (_) {
        return GenericBlocBuilder<PostBloc, PostEntity>(
          successStatusTitle: 'Successfully deleted',
          progressStatusTitle: 'Deleting post...',
          onRetryPressed: () {
            context.read<PostBloc>().add(PostDeleted(post));
          },
          onSuccessPressed: () => pop(context, 2),
        );
      },
    );
  }

  void _snackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: const Color(0xFF556080),
        duration: const Duration(seconds: 3),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        content: Row(
          children: [
            const Icon(Icons.info, color: Color(0xFF2f87e8)),
            const SizedBox(width: 10),
            Text(message, style: const TextStyle(color: Colors.white))
          ],
        ),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void _deleteComment(CommentEntity comment) {
    context.read<CommentBloc>().add(CommentDeleted(comment));
    showDialog(
      context: context,
      builder: (_) {
        return GenericBlocBuilder<CommentBloc, CommentEntity>(
          progressStatusTitle: 'Deleting comment...',
          onRetryPressed: () {
            context.read<CommentBloc>().add(CommentDeleted(comment));
          },
          successWidget: (_) {
            WidgetsBinding.instance.addPostFrameCallback(
              (_) {
                _getUserComments();
                closeOverlay(context);
                _snackBar('Successfully deleted');
              },
            );
            return const SizedBox();
          },
        );
      },
    );
  }

  Widget get _createComment {
    String name = '';
    String commentBody = '';

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CircleAvatar(
          radius: 25,
          backgroundColor: Color(0xFFcad1e2),
          backgroundImage: AssetImage(AppAsset.user),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                TextInput(
                  focusNode: userNameFocusNode,
                  hint: 'Write a comment',
                  maxLine: 3,
                  autovalidateMode: AutovalidateMode.disabled,
                  controller: commentBodyEditingController,
                  validator: (String? value) {
                    if (value!.isNotEmpty) return null;
                    return 'Cannot be empty';
                  },
                  onChanged: (String value) {
                    commentBody = value;
                  },
                ),
                const SizedBox(height: 10),
                TextInput(
                  focusNode: commentBodyFocusNode,
                  icon: const Icon(Icons.person, color: Color(0xFF556080)),
                  hint: 'Name',
                  autovalidateMode: AutovalidateMode.disabled,
                  controller: nameEditingController,
                  validator: (String? value) {
                    if (value!.isNotEmpty) return null;
                    return 'Cannot be empty';
                  },
                  onChanged: (String value) {
                    name = value;
                  },
                ),
                ElevatedButton(
                  onPressed: () {
                    bool isValid = formKey.currentState?.validate() ?? false;
                    userNameFocusNode.unfocus();
                    commentBodyFocusNode.unfocus();
                    if (isValid) {
                      final comment = CommentEntity(
                        id: 0,
                        postId: widget.post.id,
                        name: name,
                        email: 'user@testUser',
                        body: commentBody,
                      );

                      context.read<CommentBloc>().add(CommentCreated(comment));
                      showDialog(
                        context: context,
                        builder: (_) {
                          return GenericBlocBuilder<CommentBloc, CommentEntity>(
                            progressStatusTitle: '',
                            emptyWidget:
                                const EmptyWidget(message: 'No comment'),
                            onRetryPressed: () {
                              context
                                  .read<CommentBloc>()
                                  .add(CommentCreated(comment));
                            },
                            successWidget: (_) {
                              WidgetsBinding.instance.addPostFrameCallback(
                                (_) {
                                  nameEditingController.clear();
                                  commentBodyEditingController.clear();
                                  _snackBar('Successfully created');
                                  closeOverlay(context);
                                  _getUserComments();
                                },
                              );
                              return const SizedBox();
                            },
                          );
                        },
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF556080),
                  ),
                  child: const Text('Post comment'),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            _postItem,
            const Padding(
              padding: EdgeInsets.only(top: 15),
              child: Text('Comments', style: headLine2),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(thickness: 2),
            ),
            _createComment,
            _commentItem,
          ],
        ),
      ),
    );
  }
}

import 'package:blog_app/models/blog.dart';
import 'package:blog_app/providers/filter_provider.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class SearchContainer extends StatefulWidget {
  const SearchContainer(
      {super.key, required this.onChange, required this.showFilter});
  final void Function(String) onChange;
  final bool showFilter;

  @override
  State<SearchContainer> createState() => _SearchContainerState();
}

class _SearchContainerState extends State<SearchContainer> {
  void _openFilterBox() {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        final filterProvider = context.read<FilterProvider>();
        final activeFilters = filterProvider.activefilters;
        final List<BlogCategory> setFilters = activeFilters;

        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              content: SizedBox(
                height: 300,
                width: 300,
                child: Column(
                  children: [
                    const Text('Filter By Category'),
                    SwitchListTile(
                      value: setFilters.contains(BlogCategory.education),
                      onChanged: (val) {
                        setState(() {
                          if (val) {
                            setFilters.add(BlogCategory.education);
                          } else {
                            setFilters.remove(BlogCategory.education);
                          }
                        });
                      },
                      title: const Text('Education'),
                    ),
                    SwitchListTile(
                      value: setFilters.contains(BlogCategory.technology),
                      onChanged: (val) {
                        setState(() {
                          if (val) {
                            setFilters.add(BlogCategory.technology);
                          } else {
                            setFilters.remove(BlogCategory.technology);
                          }
                        });
                      },
                      title: const Text('Technology'),
                    ),
                    SwitchListTile(
                      value: setFilters.contains(BlogCategory.medical),
                      onChanged: (val) {
                        setState(() {
                          if (val) {
                            setFilters.add(BlogCategory.medical);
                          } else {
                            setFilters.remove(BlogCategory.medical);
                          }
                        });
                      },
                      title: const Text('Medical'),
                    ),
                    SwitchListTile(
                      value: setFilters.contains(BlogCategory.engineering),
                      onChanged: (val) {
                        setState(() {
                          if (val) {
                            setFilters.add(BlogCategory.engineering);
                          } else {
                            setFilters.remove(BlogCategory.engineering);
                          }
                        });
                      },
                      title: const Text('Engineering'),
                    ),
                    Row(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            setFilters.clear();
                            filterProvider.setFilters(setFilters);
                            Navigator.of(context).pop();
                          },
                          child: const Text('Reset'),
                        ),
                        const Gap(10),
                        ElevatedButton(
                          onPressed: () {
                            filterProvider.setFilters(setFilters);
                            Navigator.of(context).pop();
                          },
                          child: const Text('Apply'),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
      ),
      child: ListTile(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.search,
            color: Colors.white,
          ),
          style: IconButton.styleFrom(
            backgroundColor: Colors.orange,
          ),
        ),
        horizontalTitleGap: 0,
        trailing: widget.showFilter
            ? IconButton(
                onPressed: _openFilterBox, icon: const Icon(Icons.tune))
            : null,
        title: TextField(
          onChanged: widget.onChange,
          decoration: const InputDecoration(
            hintText: 'Search by title',
            hintStyle: TextStyle(fontSize: 15),
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ),
    );
  }
}

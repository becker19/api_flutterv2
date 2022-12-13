import 'package:api_flutterv2/providers/lugar_provider.dart';
import 'package:api_flutterv2/services/lugar_service.dart';
import 'package:api_flutterv2/widgets/textformfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LugarPage extends StatelessWidget {
  const LugarPage({super.key});

  @override
  Widget build(BuildContext context) {
    final lugarService = Provider.of<LugaresService>(context);
    return ChangeNotifierProvider(
      create: (_) => LugarFormProvider(lugarService.seleccionarLugar),
      child: LugarFormPage(lugarService: lugarService),
    );
  }
}

class LugarFormPage extends StatelessWidget {
  final LugaresService lugarService;

  const LugarFormPage({super.key, required this.lugarService});

  @override
  Widget build(BuildContext context) {
    final lugarForm = Provider.of<LugarFormProvider>(context);
    final dato = lugarForm.lugar;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Lugares'),
      ),
      body: Form(
        key: lugarForm.formkey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              CustomTextFormField(
                initialValue: dato.nombre,
                hintText: 'Nombre',
                onChanged: (value) => dato.nombre = value,
              ),
              const SizedBox(
                height: 10,
              ),
              CustomTextFormField(
                maxLines: 5,
                initialValue: dato.descripcion,
                hintText: 'Descripcion',
                onChanged: (value) => dato.descripcion = value,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          lugarService.crearOactualizar(lugarForm.lugar);
        },
        child: const Icon(Icons.save),
      ),
    );
  }
}

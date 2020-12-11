package com.gana.dara.controller;

//Imports the Google Cloud client library
import com.google.cloud.texttospeech.v1.AudioConfig;
import com.google.cloud.texttospeech.v1.AudioEncoding;
import com.google.cloud.texttospeech.v1.SsmlVoiceGender;
import com.google.cloud.texttospeech.v1.SynthesisInput;
import com.google.cloud.texttospeech.v1.SynthesizeSpeechResponse;
import com.google.cloud.texttospeech.v1.TextToSpeechClient;
import com.google.cloud.texttospeech.v1.VoiceSelectionParams;
import com.google.protobuf.ByteString;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Arrays;

/**
 * Google Cloud TextToSpeech API sample application. Example usage: mvn package
 * exec:java -Dexec.mainClass='com.example.texttospeech.QuickstartSample'
 */
public class QuickstartSample_tts {

	/** Demonstrates using the Text-to-Speech API. */
	public static void main(String... args) throws Exception {
		// Instantiates a client

		try {
			TextToSpeechClient textToSpeechClient = TextToSpeechClient.create();
			// Set the text input to be synthesized
			SynthesisInput input = SynthesisInput.newBuilder().setText("아").build();

			// Build the voice request, select the language code ("en-US") and the ssml
			// voice gender
			// ("neutral")
			VoiceSelectionParams voice = VoiceSelectionParams.newBuilder().setLanguageCode("ko-KR")
					.setSsmlGender(SsmlVoiceGender.NEUTRAL).build();

			// Select the type of audio file you want returned
			AudioConfig audioConfig = AudioConfig.newBuilder().setAudioEncoding(AudioEncoding.MP3).build();

			// Perform the text-to-speech request on the text input with the selected voice
			// parameters and
			// audio file type
			SynthesizeSpeechResponse response = textToSpeechClient.synthesizeSpeech(input, voice, audioConfig);

			// Get the audio contents from the response
			ByteString audioContents = response.getAudioContent();

			// Write the response to the output file.
			OutputStream out = null;
			try {
				out = new FileOutputStream(new File("/Users/cheryl/Downloads/00.mp3"));
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			byte[] rawByte = audioContents.toByteArray();
			out.write(Arrays.copyOfRange(rawByte, 44, rawByte.length));
			System.out.println("Audio content written to file \"output.mp3\"");
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
}
